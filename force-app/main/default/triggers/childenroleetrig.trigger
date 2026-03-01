trigger childenroleetrig on childenrolee__c (before update,before insert ,after insert,after update ) {

       system.debug('trigger size'+Trigger.size);
        if(trigger.isbefore && ( trigger.isupdate))
        {
    //   childenrlleehandler.test(trigger.new);
         /*    for(integer i =0 ;i < 4444444;i++)
             {
                 
             }
          */ 
        }
    if(trigger.isafter && trigger.isupdate)
    {
      //  childenrlleehandler.testt2(trigger.new);
    }
    
}