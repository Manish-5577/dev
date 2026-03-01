public class postActionCaseClosure {

    @invocablemethod(label = 'caseClosure'
                     description= ' if user ask for case or list of case to be closed then update account last_case_close_date__c with lastest case close date associated with it and send email to account owner manager ')
    public static List<string> updateaccountofCase(List<CaseInput> caseInput)
    { 
     set<Id> acctid = new set<id>();
        for(CaseInput cc : caseInput)
        { system.debug('cc=>'+cc);
           if(!string.isblank(cc.AccountId))
           {   
               acctid.add(cc.accountid);
           system.debug('line 13'+cc.accountid);
           }
        }
List<account> acctoUpdate = new List<account>();
     
 List<Messaging.SingleEmailMessage> emailsWithTargetObjectId = new List<Messaging.SingleEmailMessage>();
     for(account acc : [select id,ownerid,owner.managerid,(select id,closeddate from Cases where status ='closed' and ClosedDate = LAST_N_DAYS:30 order by closeddate desc) from account where id in : acctid])
     {  
         if(acc.cases.size() > 5 &&  !string.isblank(acc.owner.managerid) )
         {   system.debug('masdand');
          
             Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setTargetObjectId(acc.owner.managerid);
            email.setSaveAsActivity(false);
            email.setSubject('congratulation sirji aapke account ke 5 case close ho gaye hai  ');
            email.setPlainTextBody('Congratulations on successfully closing the 5 case in month  ');
            emailsWithTargetObjectId.add(email);
             acc.last_case_close_date__c = acc.cases[acc.cases.size()-1].closeddate.date();
             acc.Description = 'let see bulk update  dAYs';
             acctoUpdate.add(acc);
             
             
         }
         else if(acc.cases.size() >0  &&  acc.cases.size() <= 5)
         { system.debug('lalallaa');
             acc.last_case_close_date__c = acc.cases[acc.cases.size()-1].closeddate.date();
             acc.Description = '1 dAYs';
             acctoUpdate.add(acc);
         }
     }
     if(emailsWithTargetObjectId.size()>0)
     {
           Messaging.sendEmail(emailsWithTargetObjectId);
     }
     update acctoUpdate;
     system.debug('line 47');
     return new list<string>{string.valueof(acctoUpdate[0].Id)};
    }
    
     public class CaseInput {
        @InvocableVariable(required=true)
        public Id caseId;

        @InvocableVariable(required=true)
        public String AccountId;
    }
    
    
}