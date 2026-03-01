global class emailservicedemo implements Messaging.InboundEmailHandler {
  global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        try {
   system.debug('line 7');
            Id parentId = null; // Set this if you want to link files to a record
 system.debug('line 999');
             account acc = new account();
             acc.name = 'testingg';
             acc.industry = 'agriculture';
            insert acc;
            system.debug('acc id==>'+acc.id);
                 
            // Process BINARY attachments
            if (email.binaryAttachments != null && !email.binaryAttachments.isEmpty()) {
                for (Messaging.Inboundemail.BinaryAttachment binAtt : email.binaryAttachments) {
                    system.debug('line 13 binary attachment');
                  //  insertContentVersion(binAtt, parentId);
                 //   string data = string.valueof(binatt.body);
                   httprequest req = new httprequest();
req.setEndpoint('https://tccss-dev-ed.develop.my.salesforce-sites.com/services/apexrest/api/Wbhooks/pushDetailsdemo');
req.setMethod('POST');
req.setHeader('Content-Type', 'text/plain');
   system.debug('line 20');
req.setBody(EncodingUtil.base64Encode(binAtt.body));
system.debug('line 22');/// future callout 
Http h = new Http();system.debug('line 22');
HttpResponse res = h.send(req);
                    system.debug('line 23 '+res.getBody());
                    if(res.getstatuscode() == 200)
                    {
                          system.debug('line 25 ok sytataus');system.debug(string.valueof(res.getbody()));
                    }
                    else {
                        system.debug('line 28');
                    }
                }
            }

            // Process TEXT attachments
            if (email.textAttachments != null && !email.textAttachments.isEmpty()) {
                for (Messaging.Inboundemail.TextAttachment txtAtt : email.textAttachments) {
                  //  insertTextContentVersion(txtAtt, parentId);
                   httprequest req = new httprequest();
req.setEndpoint('https://tccss-dev-ed.develop.my.salesforce-sites.com/services/apexrest/api/Wbhooks/pushDetailsdemo');
req.setMethod('POST');
req.setHeader('Content-Type', 'application/octet-stream');
req.setBody(txtAtt.body);
Http h = new Http();system.debug('line 22');
HttpResponse res = h.send(req);
                    system.debug('line 23 '+res.getBody());
                    if(res.getstatuscode() == 200)
                    {
                          system.debug('line 25 ok sytataus');system.debug(string.valueof(res.getbody()));
                    }
                    else {
                        system.debug('line 28');
                    }
                }
            }

        } catch (Exception ex) {
            System.debug('ERROR in Email Service: ' + ex.getMessage());
        }

        return result;
    }


    private void insertContentVersion(Messaging.Inboundemail.BinaryAttachment att, Id parentId) {
        string ss = string.valueof(att.body);
        ContentVersion cv = new ContentVersion(
            Title        = att.filename,
            PathOnClient = '/' + att.filename,
            VersionData  = att.body,
            FirstPublishLocationId = parentId
        );
    //    insert cv;
    }


    private void insertTextContentVersion(Messaging.Inboundemail.TextAttachment att, Id parentId) {
        Blob fileBlob = Blob.valueOf(att.body);
        string hh = string.valueof(att.body);
        system.debug('asasd');
        ContentVersion cv = new ContentVersion(
            Title        = att.filename,
            PathOnClient = '/' + att.filename,
            VersionData  = fileBlob,
            FirstPublishLocationId = parentId
        );
      //  insert cv;
    }

}