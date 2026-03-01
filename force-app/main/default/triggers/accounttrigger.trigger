trigger accounttrigger on Account (before insert,before update) {

    
    if( trigger.isbefore && trigger.isInsert){
    for(account acc : trigger.new)
    {    acc.name = 'date'+ string.valueof(Date.today());
         acc.LastName = 'date'+ string.valueof(Date.today());
        if(acc.TypeofAcc__c == 'Customer')
        {  system.debug('line 9');
            acc.Since_Date__c = Date.today();
        }
    }
    }
    else if(trigger.isbefore && trigger.isupdate)
    {
        for(account acc : trigger.new)
        {
             if(acc.TypeofAcc__c == 'Customer')
        {
            acc.Since_Date__c = Date.today();
        }
           if(trigger.oldmap.get(acc.id).TypeofAcc__c == 'Customer' && acc.TypeofAcc__c == 'Prospect')
           {
               acc.adderror('u cant change the status back to prospect');
           }
            if(acc.TypeofAcc__c == 'customer' && acc.Since_Date__c == null)
            {
                acc.adderror('since date cannot be empty for account of type customer ');
            }
        }
    }
}