public class SoftDrinkOrderStatus {

    
    @invocableMethod(label='Order Status' description='Return status of the Soft Drink Order,when user ask for it,for example user can say what is the status of my soft drink order ABC')
    Public static List<string> getstatus(List<Integer> orderNumber)
    {
        Soft_Drink_Order__c sd = [select Id,status__c from  Soft_Drink_Order__c where Order_Number__c =:orderNumber[0] ];
        return new list<string>{sd.status__c};
    }
}