trigger casetrig on Case (before insert) {
    
    
    system.debug('case count11'+[select id from case].size());
    casehandler.abcc();

}