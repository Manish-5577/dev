trigger contacttrigger on Contact (before insert,after update, before update) {

    List<publish_event__e> peList = new List<publish_event__e>();
    if(trigger.isbefore && trigger.isUpdate)
    {
        for(contact cc : trigger.new)
        {
         //   system.debug('cc last modified date '+ cc.lastmodifieddate + 'old modified date ==>'+ trigger.oldmap.get(cc.id).lastmodifieddate);
        }        
    }
     if(trigger.isafter && trigger.isupdate)
     {
         for(contact cc : trigger.new)
         {
             system.debug('cc last modifed update'+cc.lastmodifieddate + 'old modified date ==>'+ trigger.oldmap.get(cc.id).lastmodifieddate);
             publish_event__e  pe = new publish_event__e();
             pe.caseId__c = cc.Id;
             peList.add(pe);
         }
         if(peList.size() > 0)
         {
             eventbus.publish(peList);
         }
     }
}