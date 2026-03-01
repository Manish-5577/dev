public class getcasebycaseNumber {
    
    
    @invocableMethod(label = 'get case record based on case Numbers'
                    description = 'get case details by case number')
    public static List<response> getcasedetail(list<request> req){ List<response> reslist = new list<response>();
       if(req == null ){
 throw new listexception('one member at least  required');
      }
     if(req != null)
     {
         case cc = [select id,issue_Type__c,ownerid,priority	 from case where casenumber = : req[0].casenumber limit 1];
        response res = new response();
         res.caserecord = cc;
         reslist.add(res);
     }
        return reslist;                                                          
    }

    public class request{
       @invocableVariable public string casenumber;
    }
    
     public class response{
       @invocableVariable public case caserecord;
    }
}