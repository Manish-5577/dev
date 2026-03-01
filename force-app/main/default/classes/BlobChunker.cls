public class BlobChunker {
    // chunkSize in bytes (NOT base64)
    public static List<String> chunkBase64(Blob data, Integer chunkSizeBytes) {
        String base64 = EncodingUtil.base64Encode(data);
        List<String> chunks = new List<String>();

        Integer pos = 0;
        while (pos < base64.length()) {
            Integer endPos = pos + chunkSizeBytes;
            if (endPos > base64.length()) {
                endPos = base64.length();
            }
            chunks.add(base64.substring(pos, endPos));
            pos = endPos;
        }
        return chunks;
    }
}