public class createsoftdrinkorder {

    
    
    @invocableMethod(label='createSoftDrinkOrder'
                    description ='when user ask for create softdrink order call this action it will create soft drink record and return the status of soft drink order')
    public static List<response> createsoftDrink(List<wrapper> wrp)
    {  List<response> res = new List<response>();
        try{
        if(wrp != null){
             Soft_Drink_Order__c sfo = new Soft_Drink_Order__c();
             sfo.Order_Number__c = wrp[0].Order_Number;
             sfo.Quantity__c = wrp[0].quantty;
             sfo.Soft_Drink__c = wrp[0].softdrinkrecordId;
            insert sfo;
          response rr = new response();
         rr.status = 'Record created successfully !!!!!!!!!!!!!!!!!!!!';
         rr.recordId = sfo.Id;
            res.add(rr);
        }      
        else{
             throw new System.ListException('List cannot be empty');
        }
    }catch(exception ee)
    {
         response rr = new response();
         rr.status = 'oops something wrong happen '+ ee.getmessage();
         rr.recordId = null;
        res.add(rr);
    }
     return res;
    }
    public class wrapper{
        
      @invocableVariable  public string softdrinkrecordId;
          @invocableVariable    public decimal quantty;
           @invocableVariable   public decimal Order_Number;
    }
    public class response {
          @invocableVariable  public string status;
          @invocableVariable public string recordId;
    }
}