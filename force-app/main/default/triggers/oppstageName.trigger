trigger oppstageName on Opportunity (before insert, before update) {
    if(trigger.isBefore){
        if(trigger.isInsert){
    for(opportunity opp : trigger.new)
    {
        opp.StageDateTime__c = datetime.now();
    }
        }
        if(trigger.isUpdate)
        {
            for(opportunity opp: trigger.new)
            {
                if(trigger.oldmap.get(opp.id).stagename != opp.stagename  &&
                  opp.stagename != '')
                {
                    if(opp.StageDateTime__c != null){
                           long milisec =    (long)datetime.now().getTime() - opp.createddate.getTime();
                        opp.stageTime__c = milisec/(60*1000);
                    }else{
                     long milisec =    (long)datetime.now().getTime() - opp.StageDateTime__c.getTime();
                        opp.stageTime__c = milisec/(60*1000);                       
                    }
                }
            }
        }
        
    }
    
}