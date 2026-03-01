trigger publishplatformevents on Case (after insert) {
list<platformeventtest__e> pp = new list<platformeventtest__e>();
    for(case cc : trigger.new)
    {
        platformeventtest__e p1 = new platformeventtest__e();
        p1.Caserecordid__c = cc.id;
        p1.CasedATE__c = date.today();
        pp.add(p1);
    }
    if(pp.size() > 0)
    { system.debug('line 11'+ pp);
        eventbus.publish(pp);
    }
}