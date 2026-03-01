public class recordtriggeredAgent {

    @invocableMethod(label= 'update child record'
                    description = 'this action will update record of case based on issue type of case')
    public static list<string> updatecaseRec(list<caseInput> inputrec)
    {  list<string> responsee = new list<string>();
        try{
        if(inputrec == null && inputrec.isEmpty() )
        {   string err = 'atleast one input required!!';
           responsee.add(err);
            return responsee;
        }
        else{
             case cc = [select id,issue_Type__c from case where id = :inputrec[0].recid];
             cc.description = 'description updated based on case issue type'+inputrec[0].issueType;
             update cc;  
            responsee.add('successfully record updated !!!!');
        }
    }
     catch(exception ee)
     {
           responsee.add('error occured! !!!!'+ee.getmessage());
     }
     return responsee;
    }
    public class caseInput
    {    @invocableVariable public string recid;
         @invocableVariable public string issueType;
       
    }
}