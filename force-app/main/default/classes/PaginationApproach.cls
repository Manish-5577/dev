public class PaginationApproach {

    @auraenabled(cacheable = true)
    public static list<contact>  offsetApproach(integer offset , integer limits)
    {
        try{
               return [select id,Name,Phone,Email from contact limit : limits offset : offset];
        }   
        catch(exception ex)
        {
             throw new auraHandledexception('oopps something wrong happen'+ ex.getMessage());
        }
    }
    
}