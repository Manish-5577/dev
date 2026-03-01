public class AccountSummaryPromptRecordSummary {

     @invocableMethod(label = 'Soft Drink Orders'
                    description = 'Find Soft Drink For Account'
                CapabilityType='PromptTemplateType://einstein_gpt__recordSummary')
    public static List<response> getSoftDrinkData22(List<Request> requests)
    {
        if(requests.size() != 1) throw new ListException('The requests list must contains one entry only');
        Account acc = requests[0].objectToSummarize;
        List<Soft_Drink_Order__c> SoftDrinkOrders = [select Id,Soft_Drink__r.Name,Quantity__c from Soft_Drink_Order__c 
                                                    where Account__c = : acc.Id];
        string responseData = null;
        if(softDrinkOrders.isEmpty())
        {
            responseData = 'There are not soft Drink records.';
        }else{
            for( Soft_Drink_Order__c drink :SoftDrinkOrders )
            {
                responseData = (responseData != null) ? responseData + '\n' : '';
                responseData += String.format('Soft Drink Details: {0}, {1}.', new list<Object>{drink.Soft_Drink__r.Name, drink.Quantity__c});
            }
        }
         List<case> cases = [select id,reason,subject, description from case where accountId =: acc.Id];
        if(cases.isEmpty())
        {
            responseData += 'There are no Cases Records.';
        }else{
            for(case ca : cases)
            {
                responseData = (responseData != null) ? responseData + '\n' : '';
                responseData += String.format('Case Detail: - Subject , Reason, Description of the case as below : {0}, {1}, {2}.',
                                              new List<object>{ca.Subject, ca.Reason, ca.Description});
            }
        }
      List<Response> responses = new List<Response>();
       Response res = new Response();
       res.prompt = responseData;
        responses.add(res);
       // return new List<String>{ responseData };
        return responses;
    }
    
    public class response{
        @invocableVariable
        public string Prompt;
    }
    public class Request{
        @InvocableVariable(required=true)
        public Account objectToSummarize;
    }
}