public class batchablechunkbehaviour implements  Database.Batchable<sObject> {

    public Database.QueryLocator start(database.batchablecontext bc)
    {
        return database.getQueryLocator('select id,name from account');
    }
    public void execute(database.batchablecontext bc, List<account> accScope)
    {integer i =0;
        for(account acc : accScope)
        {  if( acc.id  != '001gK00000I0LQMQA3' || acc.id != '001gK00000I0J57QAF' || acc.id != '001gK00000Hzw6vQAB')
        { for(integer j =0; j<999999999; j++){
            //
        }
            if(i == 5)
            {
                ACC.Active__c = 'YESREEWWR';
            }else{
                ACC.Name = 'I AM ACCOUNT'+ i*i;
            }
             i++;
        }
         
        }
    database.update(accscope,false);
    }
    public void finish(Database.BatchableContext bc)
    {
        system.debug('finish');
    }
}