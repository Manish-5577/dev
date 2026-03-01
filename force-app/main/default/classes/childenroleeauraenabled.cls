public class childenroleeauraenabled {

    
     @auraenabled(cacheable = true)
    public static list<childenrolee__c> getchildenrolle()
    {
        try{
            return [select id,name,testing__c from childenrolee__c limit 10 ];
        }
        catch(exception ee)
        {
            throw new aurahandledexception('oops error'+ ee.getMessage());
        }
    }
}