trigger orderofExecution on orderofExecution__c (before insert) {

    apexbehaviourParent.callchildmethod();
  /* if(trigger.isbefore && trigger.isupdate)
    {
    for(orderofExecution__c oe : trigger.new)
    {  system.debug('line 6 new '+ trigger.new);
     system.debug('line 8 old'+ Trigger.old);
       //oe.picklistval__c = '1';
        
    }
    }*/
 
   /*  if(trigger.isafter && trigger.isupdate)
     {
          orderofExecution__c oe = [select id,picklistval__c from orderofExecution__c where id =: trigger.new[0].Id];
          oe.picklistval__c = '2';
          update oe;
     }*/
    
}