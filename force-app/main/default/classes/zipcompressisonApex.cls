public class zipcompressisonApex {
    
  public static void testinjdweh()
  {
      Compression.ZipWriter zipWriter = new Compression.ZipWriter();
      zipWriter.setLevel(Compression.Level.BEST_COMPRESSION);
            Set<Id> versionIds = new Set<Id>{'068gK0000050eSQQAY','068gK0000050fgEQAQ','068gK0000050foHQAQ'};
        for(ContentVersion cv : [SELECT Id, Title, FileExtension, VersionData FROM ContentVersion where id in : versionIds])
        {
String fileName = cv.Title + (String.isNotBlank(cv.FileExtension) ? '.' + cv.FileExtension : '');
zipWriter.addEntry(fileName, cv.VersionData);
        }
      
      List<Compression.ZipEntry> entries = zipWriter.getEntries();

// Loop through entries to inspect
for (Compression.ZipEntry entry : entries) {
    System.debug('Entry Name: ' + entry.getName());
    System.debug('Uncompressed Size: ' + entry.getUncompressedSize());
    system.debug('get compressed size:+>'+ entry.getCompressedSize());
    System.debug('Comment: ' + entry.getComment());
    System.debug('Method: ' + entry.getMethod());
}
        Blob zipBlob = zipWriter.getArchive();
// Create a new ContentVersion for the zipped file
ContentVersion zipVersion = new ContentVersion();
zipVersion.ContentLocation = 'S'; // Stored in Salesforce
zipVersion.PathOnClient = 'CompressedFilesOf_' + contact.Name + '.zip';
zipVersion.Title = 'CompressedFilesOf_' + contact.Name;
zipVersion.VersionData = zipBlob;
insert zipVersion;
      system.debug('line 21'+zipWriter.getEntries());
      
      ContentDocumentLink cdl = new ContentDocumentLink();
cdl.ContentDocumentId = [SELECT ContentDocumentId FROM ContentVersion WHERE Id = :zipVersion.Id].ContentDocumentId;
cdl.LinkedEntityId = '003gK00000Hf7VBQAZ';
cdl.ShareType = 'V'; // Viewer access
insert cdl;

 
  }
}