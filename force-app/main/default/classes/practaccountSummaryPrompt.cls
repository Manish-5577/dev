public class practaccountSummaryPrompt {
    
    @invocablemethod(label = 'Soft Drink Orders practise'
                    description = 'Find Soft Drink For Account'
                CapabilityType='PromptTemplateType://einstein_gpt__fieldCompletion')
    public static list<response> getaccountsummaryfield(list<request> req)
    {string responsedata = '';
        if(req.size() < 1){throw new ListException('The requests list must contains one entry only');}
        else { 
             Account acc = req[0].RelatedEntity;
        List<Soft_Drink_Order__c> SoftDrinkOrders = [select Id,Soft_Drink__r.Name,Quantity__c from Soft_Drink_Order__c 
                                                    where Account__c = : acc.Id];
              for(Soft_Drink_Order__c ss :SoftDrinkOrders ){
              responsedata = responsedata != null ? responsedata + '\n' : '';
              responsedata += string.format('soft drink details are : {0} {1}', new list<object>{ss.Soft_Drink__r.Name, ss.Quantity__c});
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
             }
        response res = new response();
        res.Prompt = responseData ;
        return new  List<response>{res};
    }
    
    public class response{
      @invocablevariable  
        public string Prompt;
    }
    public class request{
        @invocablevariable(required = true)
        public Account RelatedEntity;
    }

}