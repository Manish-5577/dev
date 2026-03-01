public class CaserecordTriggeredFlow {
    @invocableMethod(label='pract record triggered agent'
                    description ='from case record id  will assign queue to case record ')
    public static List<response> updatecaseOwnership(list<request> req)
    {  List<response>  resList = new List<response>();
     try{ if(req != null && req.size() > 0)
        {
             List<Group> queues = [
                        SELECT Id, DeveloperName 
                        FROM Group 
                        WHERE DeveloperName = :req[0].queueName
                        AND Type = 'Queue'
                        LIMIT 1
                    ];
            if(queues.size()>0)
            {  try{
                case cc = new case(id = req[0].caseId, ownerid = queues[0].Id);
                update cc;
                response rr = new response();
                rr.responsee = 'success';
                resList.add(rr);
            }
             catch(exception  ee)
             {
                 response rr = new response();
                 rr.responsee = 'oops something wrong happen' + ee.getmessage();
                 resList.add(rr);
             }
            }
        }
        }
     catch(exception ee )
     {
          response rr = new response();
                 rr.responsee = 'oops something wrong happen'  + ee.getmessage();
                 resList.add(rr);
     }
       return resList;
    }
    public class request{
        @invocablevariable (label='Case ID' description='The ID of the Case to assign to the queue' required=true)
           public string caseId;
        @invocablevariable (label='Queue Developer Name' description='The developer name of the queue' required=true)
            public string queueName;
    }
    public class response{
        @invocableVariable
        public string responsee;
    }
}