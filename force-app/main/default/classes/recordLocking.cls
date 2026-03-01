public class recordLocking {

    
    @auraenabled
    public static void test1()
    {
        childenrolee__c cc = [select id,amount__C from childenrolee__c where id = 'a02gK00000C5HfdQAF' for update];
        cc.amount__C += 30;
        update cc;
    }
    
}