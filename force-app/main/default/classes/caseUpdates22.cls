public class caseUpdates22 {

         @InvocableMethod(
        label='Get Case Id22'
        description=' from case id we find issue type field value of case based on that we search queue and assign queue to case '
    )
    public static List<string> getcaseIdandAssignCase22(List<InputWrapper> request)
    { try{
        if(!request.isEmpty())
        {
             case cc = [select id,issue_Type__c from case where id = :request[0].caseId];
             if(cc != null && !string.isblank(cc.issue_Type__c))
             {
                 List<Group> queues = [
                        SELECT Id, DeveloperName 
                        FROM Group 
                        WHERE DeveloperName = :request[0].queueDeveloperName
                        AND Type = 'Queue'
                        LIMIT 1
                    ];
                 if(!queues.isEmpty())
                 {// Update case directly
                                update new Case(
                                    Id = cc.Id,
                                    OwnerId = queues[0].Id,
                                    Priority = request[0].Priority
                                );
                 }
             }
        }
        return new List<string>{'success'};
    }
     catch(exception ee)
     {
         return new List<string>{'error'};
     }
    }
      
       public class InputWrapper {
       @InvocableVariable(label='Queue Developer Name' description='The developer name of the queue' required=true)
        public String queueDeveloperName;
        @InvocableVariable(label='Case ID' description='The ID of the Case to assign to the queue' required=true)
        public String caseId;
        @InvocableVariable(label='Case Priority' description='The priority of the Case' required=true)
        public String Priority;
    }
}