public without sharing class agentforcetesting {
    
    @invocableMethod(label = 'count lead in org'
                    description= 'based on user input this action will count lead present in org')
    public static list<integer> countlead(list<string> invaliddata)
    {    list<integer> ii = new list<integer>();
           ii.add((integer)[select count(id)cont from lead ][0].get('cont'));
        return  ii;
    }
    
   
    

}