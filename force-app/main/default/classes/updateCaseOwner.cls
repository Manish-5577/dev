public class updateCaseOwner {

    @invocableMethod(label = 'get case details')
    public static list<output> updateCaseowner(list<inputReq> inpReq)
    {  list<output> outputlist = new list<output>();
        if(inpReq != null)
        {   id recordid = inpReq[0].recordId;
            SObjectType objType = recordid.getSObjectType();
String objectName = objType.getDescribe().getName();
// Build dynamic SOQL to fetch all fields
List<String> allFields = new List<String>(objType.getDescribe().fields.getMap().keySet());
String soql = 'SELECT ' + String.join(allFields, ',') +
              ' FROM ' + objectName +
              ' WHERE Id = :recordId';
// Query the actual record
SObject recordDetails = Database.query(soql); case cc = (case)recordDetails;
            string issuetype = cc.issue_Type__c;
        group gg = [select id from group where type = 'queue' and developername = :issuetype limit 1 ];
            cc.ownerid = gg.id;
            update cc;
         output oo = new output();
         oo.msssg= ' success fully updated!!';
        outputlist.add(oo);
        }
      return outputlist;
    }
    public class inputReq{
        @invocablevariable public string recordId;
    }
    public class output{
        @invocablevariable public string  msssg;
    }
}