public class customlookup {

    @AuraEnabled(cacheable=true)
    public static List<Account> getchAccount(string searchkeyword)
    {   try{  system.debug('searchkeyword'+searchkeyword);
        string  mm = '%' + searchkeyword + '%';
        return database.query('select id,name,rating from account where name like : mm ');
    }
     catch(exception ee)
     {
         throw new aurahandledException(ee.getMessage());
     }
    }
}