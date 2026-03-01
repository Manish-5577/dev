public class testException extends Exception {
    
     public void test1()
     {
         system.debug('line 5 executed meesage!!');
     }

   public Integer errorCode;

    public testException(String message, Integer errorCode) {
        this.errorCode = errorCode;
    }
    public override string getMessage()
    {
        return ' error code testt1111!!!' +errorCode;
    }

    public Integer getErrorCode() {
        return errorCode;
    }

    public String getCustomMessage() {
        return 'Error Code: ' + errorCode + 
               ' | Message: ' + getMessage();
    }
}