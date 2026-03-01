public with sharing class FileChunkSenderService {

    @future(callout=true)
    public static void sendFileChunks(Id contentVersionId, String targetFileId) {
        try{
        ContentVersion cv = [
            SELECT VersionData, Title
            FROM ContentVersion
            WHERE Id = :contentVersionId
            LIMIT 1
        ];
        system.debug('line 12');
        Blob fileData = cv.VersionData;system.debug('line 13');
        String base64Data = EncodingUtil.base64Encode(fileData);
        system.debug('line 15');
        Integer chunkCharSize = 350000; // ~350k chars (~262 KB raw). Adjust lower if hitting heap errors
        Integer totalLength = base64Data.length();
        Integer offset = 0;
        Integer index = 0;
system.debug('line 20');
        Http http = new Http();
system.debug('line 22');
        while (offset < totalLength) {
            Integer endIndex = Math.min(offset + chunkCharSize, totalLength);system.debug('line 24');
            String chunkString = base64Data.substring(offset, endIndex);
system.debug('line 26');
            Blob chunkBlob = EncodingUtil.base64Decode(chunkString);
system.debug('line 28');
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://tccss-dev-ed.develop.my.salesforce-sites.com/services/apexrest/api/Wbhooks/pushDetailsdemo');
            req.setMethod('POST');
            req.setHeader('Content-Type', 'application/octet-stream');
            req.setHeader('X-File-Id', targetFileId);
            req.setHeader('X-Chunk-Index', String.valueOf(index));
            req.setBodyAsBlob(chunkBlob);

            HttpResponse resp = http.send(req);
   system.debug('line 38');
            offset = endIndex;
            index++;
        }
    }
    
    catch(exception ex )
    {
         System.debug('Exception type caught: ' + ex.getTypeName());
    System.debug('Message: ' + ex.getMessage());
    System.debug('Line number: ' + ex.getLineNumber()); // Retrieves the line number
    System.debug('Stack trace: ' + ex.getStackTraceString());
    }
}
}