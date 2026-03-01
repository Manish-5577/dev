public class CaseSummaryPrompt {

    
       @invocableMethod(label = 'Soft Drink Orders'
                    description = 'Find Soft Drink For Account'
                CapabilityType='PromptTemplateType://einstein_gpt__fieldCompletion')
    public static List<response> getSoftDrinkData(List<request> requests)
    {
        if(requests.size() != 1) throw new ListException('The requests list must contains one entry only');
        Case cc = requests[0].RelatedEntity;
        List<casehistory> casehistory = [select Id,CaseId,Field,DataType,OldValue,NewValue from casehistory 
                                                    where CaseId = : cc.Id];
        string responseData = null;
        if(casehistory.isEmpty())
        {
            responseData = 'There are not soft Drink records.';
        }else{
            for( casehistory ccrec :casehistory )
            {
                responseData = (responseData != null) ? responseData + '\n' : '';
                responseData += String.format('Case History Details: {0}, {1}, {2}.', new list<Object>{ccrec.Field, ccrec.OldValue,ccrec.NewValue });
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
        public Case RelatedEntity;
    }
    
    
}