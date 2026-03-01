public class exceptionhandling2 {
    
    public static void abc()
    {
        try{
            testingchceckout.jfjf();
        }
        catch(testException tt)
        {
             system.debug('line 10');
             system.debug('line 11==>'+tt.getMessage());
             system.debug('line 12==>'+ tt.getCustomMessage());
        }
    }

}