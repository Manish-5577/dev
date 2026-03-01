public class callApex {
    
    @auraenabled(cacheable= true)
    public static list<case> getrelatedcase(string recordId)
    {   try{
        string query = '';
        if(!string.isBlank(recordId)){
            query = 'select id,caseNumber,contactId,accountId,status,Productid from case where accountid =: recordId ';
        }
        else{
            query = 'select id from case limit 0';
        }
        return database.query(query);
    }
     catch(exception ee)
     {
         throw new aurahandledexception(ee.getmessage());
     }
    }
    
    
}