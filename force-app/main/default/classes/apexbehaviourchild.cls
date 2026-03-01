public without sharing class apexbehaviourchild {
    
    public static void countorderexecrec()
    {
        system.debug('countofrecords==>'+[select id from orderofExecution__c].size());
    }

}