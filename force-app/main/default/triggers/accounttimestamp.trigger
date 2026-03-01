trigger accounttimestamp on Account (before update) {
    
    for(account acc : trigger.new)
    {   system.debug('line 4');
        system.debug('lastmodified time'+acc.lastmodifieddate);
    }

}