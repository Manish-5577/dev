public class fieldaccessibletest {
     
    @auraenabled(cacheable = true)
    public static List<contact> fieldlevelsecurity()
    {   string 	Query = 'select id ';
        Schema.DescribeSObjectResult[] descResult = Schema.describeSObjects(new String[]{'Contact'});
        if(descResult[0].accessible)
        {
            if(Schema.sObjectType.Contact.fields.Email.isUpdateable()){
                  Query += ' ,Email';
            }
             if(Schema.sObjectType.Contact.fields.phone.isUpdateable()){
                  Query += ' ,phone';
            }
              if(Schema.sObjectType.Contact.fields.Department.isUpdateable()){
                  Query += ' ,Department';
            }
                 if(Schema.sObjectType.Contact.fields.Level__c.isUpdateable()){
                  Query += ' ,Level__c';
            }
        }
      Query += ' from contact ';
          return Database.Query(Query);
    }
    @auraenabled
    public static void testt1()
    {
      /* account acc = [select id,name,rating from account order by createddate desc limit 1];
acc.name = 'usermode2243';
//acc.rating = 'hot';
insert  as user acc;*/
      account acc = new account();
        acc.name = 'line 33';
        acc.rating = 'warm';
        insert as user acc;  // we required create access on field as well in order to create account record 
       // so event though u have create access on account object u need create access on field as well used in query
       
       /*List<account> acclist = new list<account>();
List<Account> newAccounts = [select id,rating from account order by createddate desc limit 5];
        for(account acc : newAccounts)
        {
            acc.rating = 'hot';
            acclist.add(acc);           
        }*/
     /*   account acc = new account(name = 'insertcheck', rating = 'cold');
       account acc1 = new account(name = 'insertcheck2', rating = 'cold');
        acclist.add(acc);acclist.add(acc1);*/
/*SObjectAccessDecision securityDecision = Security.stripInaccessible(
                                         AccessType.readable, acclist);
// No exceptions are thrown and no rating is set
update  securityDecision.getRecords();*/
//System.debug('line 45'+securityDecision.getRemovedFields().get('Account')); // Prints "Rating"
//System.debug(securityDecision.getModifiedIndexes()); // Prints "1"
    }

}