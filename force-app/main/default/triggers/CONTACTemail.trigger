trigger CONTACTemail on Contact (before insert) {

    
    for(contact cc : trigger.new)
    {
        system.debug('cc email' +cc.email);
    }
}