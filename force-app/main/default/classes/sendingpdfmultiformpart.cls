public class sendingpdfmultiformpart {

    @future(callout = true)
       public static void sendFiles() {

        List<ContentVersion> files = [
            SELECT Id, Title, FileExtension, VersionData
            FROM ContentVersion
        ];

        String boundary = '----SFBoundary' + Datetime.now().getTime();
        String body = '';

        // Add metadata
        body += '--' + boundary + '\r\n';
        body += 'Content-Disposition: form-data; name="metadata"\r\n';
        body += 'Content-Type: application/json\r\n\r\n';
        body += '{"source":"Org A"}\r\n';

        // Chunk size in characters of Base64 (NOT bytes)
        Integer chunkSize = 3000000; // 3 million chars ≈ ~2.2MB binary

        for (ContentVersion cv : files) {

            // Break Base64 into chunks
            String base64Data = EncodingUtil.base64Encode(cv.VersionData);
            Integer pos = 0;
            Integer index = 0;

            while (pos < base64Data.length()) {
                Integer endPos = pos + chunkSize;
                if (endPos > base64Data.length()) {
                    endPos = base64Data.length();
                }

                String chunk = base64Data.substring(pos, endPos);

                body += '--' + boundary + '\r\n';
                body += 'Content-Disposition: form-data; name="file"; '
                     + 'filename="' + cv.Title + '.' + cv.FileExtension + '"\r\n';
                body += 'Content-Type: application/octet-stream\r\n';
                body += 'X-Chunk-Index: ' + index + '\r\n';
                body += 'X-File-Name: ' + cv.Title + '.' + cv.FileExtension + '\r\n';
                body += 'Content-Transfer-Encoding: base64\r\n\r\n';

                body += chunk + '\r\n';

                pos = endPos;
                index++;
            }
        }

        body += '--' + boundary + '--';

        Blob bodyBlob = Blob.valueOf(body);

        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:TargetOrgAPI/files/upload');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'multipart/form-data; boundary=' + boundary);
        req.setBodyAsBlob(bodyBlob);

        HttpResponse res = new Http().send(req);
        System.debug('Response: ' + res.getBody());
    }
}