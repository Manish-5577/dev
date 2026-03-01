public with sharing class testingchceckout {
    public class My1Exception extends Exception {} 
    public class My2Exception extends Exception {} 

   public static void jfjf()
   {
       try{
            //throw new testException('helll error exception !!', 200);
            insert new account(name = 'manish', rating = 'hot');
            throw new My1Exception('First exception'); 
       }
       catch(Exception e)
       {
          //  system.debug(tt.getLineNumber());
          //  system.debug(tt.getMessage());
        //   throw new testException(tt.getMessage(),tt.getLineNumber());
           throw new My2Exception('Thrown with inner exception'+ e.getMessage());
       }
   }
  
   
}