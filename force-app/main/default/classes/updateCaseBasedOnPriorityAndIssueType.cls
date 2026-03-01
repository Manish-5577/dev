public class updateCaseBasedOnPriorityAndIssueType {

    @invocableMethod
    public static list<response> updatecaseDetails(list<request> req)
    {  string resMssg = 'failure occured';
        if(req != null)
        {try{
            case cc = [select id,priority,ownerid from case where casenumber =: req[0].casenumber];
            group gg = [select id from group where type = 'Queue' and developername =: req[0].QueueDeveloperName limit 1];
            cc.ownerid = gg.id;
            cc.priority = req[0].Priority;
            update cc;
            resMssg = 'case record successfully updated';
        }
         catch(exception ee)
         {
             resMssg = 'failure occured for this reason  ' + ee.getmessage();
         }
        }
     return new list<response>{new response(resMssg)} ;
    }
    
    public class request{
        @invocablevariable
        public string QueueDeveloperName;
        @invocablevariable
        public string Priority;
        @invocablevariable
        public string casenumber;
    }
    
    public class response{
     @invocablevariable  public string status;
        public response(string res){
              this.status = res;
        }
    }
    
}