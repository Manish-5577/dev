public without sharing class countrequirement {
    
    @invocableMethod(label = 'count record present in system')
    public static list<reqoutPut> getCount(list<inputReq> req)
    {  string query;List<reqoutPut> outputlist = new List<reqoutPut>();
     if(req != null && req.size() > 0)
     {  if(req[0].sobjectname.contains('Lead')){
         system.debug('line 8');
         query =  'select count(id)con from lead';
     }
      else if(req[0].sobjectname.contains('contact'))
      {
          query = 'select count(id)con from contact ';
      }
      else if(req[0].sobjectname.contains('account'))
      {
          query = 'select count(id)con from account';
      }
     }
     if(query != '' &&  !String.isEmpty(query))
     { system.debug('line 21'+ query);
      List<AggregateResult> results = Database.query(query);    
      system.debug('results==>'+ results[0].get('con'));
      reqoutPut output = new reqoutPut();
      output.countt = (integer)results[0].get('con');
      outputlist.add(output);
     }else{
         reqoutPut output = new reqoutPut();
         output.countt = 0;
         outputlist.add(output);
     }
     return outputlist;
    }
    
    
    public class inputReq
    {
        @InvocableVariable public string sobjectname;
    }
    public class reqoutPut{
        @InvocableVariable public integer countt;
    }
}