public class getcasebycaseId {

     @InvocableMethod(
        label='Get Case Id33'
        description=' from case id we get case all fields information '
    )
    public static List<case> getcasebycaseIdasInput(List<string> caseId)
    {  string ss = '';
        if(caseId != null){ ss= 'select id,issue_Type__c,Priority from case where id = ' + '\'' + caseId[0]+ '\'';}
     else {
         ss = 'select id from case limit 0';
     }
     return database.query(ss);
    }
}