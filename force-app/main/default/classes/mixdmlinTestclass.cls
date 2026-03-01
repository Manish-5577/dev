@isTest
public class mixdmlinTestclass {
    
    @testSetup
    public static void testst()
    { usercreation();
     
    }
    @istest 
    public static void test1()
    {        account acc = new account(name='sdkjads');
             acc.ownerid = [select id from user where email = 'sthhkjhkjhk@example.com' limit 1][0].Id;
        insert acc;
       system.debug('line14'+acc.ownerId);
    }
    
    
    @future public static void usercreation()
    {
        UserRole role = [SELECT Id FROM UserRole WHERE Name = 'CEO' LIMIT 1];

         Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1];
         User testUser = new User(
            Alias = 'stdusr',
            Email = 'sthhkjhkjhk@example.com',
            EmailEncodingKey = 'UTF-8',
            LastName = 'TestUser',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            ProfileId = p.Id,
             UserRoleId = role.Id,
            TimeZoneSidKey = 'America/Los_Angeles',
            UserName = 'stduser' + DateTime.now().getTime() + '@example.com'
        );
        insert testUser;
    }

}