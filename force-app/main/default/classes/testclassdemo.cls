@istest
public class testclassdemo {
    @testsetup public static void test1()
    {     UserRole ur = [
            SELECT Id 
            FROM UserRole 
            LIMIT 1
        ];
     Profile p = [
            SELECT Id 
            FROM Profile 
            WHERE Name = 'Standard User'
            LIMIT 1
        ];
        User u = new User(
            FirstName = 'Test',
            LastName = 'User',
            Email = 'testuser@test.com',
            Username = 'testuser' + System.currentTimeMillis() + '@test.com',
            Alias = 'tuser',
            TimeZoneSidKey = 'America/New_York',
            LocaleSidKey = 'en_US',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            ProfileId = p.Id,
            UserRoleId = ur.Id
        );
        insert u;
        futuree();
    }
    @istest
    public static void test2()
    {  
        system.assertequals(1, [select id from account].size());
         account acc = new account();
         acc.name = 'manistets';
         acc.rating= 'hot';
         insert acc;
        Test.setCreatedDate(acc.id, DateTime.newInstance(2023, 1, 1));
         system.assertequals(2, [select id from account].size());
      account aa = [select id,lastmodifieddate,createddate from account where rating ='hot'];
        system.debug('cretaed'+aa.CreatedDate);
        system.debug('last modfied'+aa.lastmodifieddate);

    }
    @istest
    public static void test3()
    {
      //  accountcsv
            List<account> ls = Test.loadData(Account.sObjectType, 'accountcsv');
            system.debug([select id,lastmodifieddate,createddate from account ]);
   }
    
    
    
    
    
    
    
    @future
    public static void futuree()
    {
        insert new account(name='manitest');
    }
    
    
    

}