public class schedulerBatchQueueable  implements Queueable, Schedulable,database.batchable<sobject>  {
//database.batchable<sobject>
    
    public void execute(schedulableContext sc)
    {  futurecalling.testw();
     futurecalling.testw();
     futurecalling.testw();futurecalling.testw();futurecalling.testw();
     system.enqueuejob( new queuable2());
              //   database.executebatch(new schedulerBatchQueueable() ,200);     
    //   system.enqueuejob( new queuable2());
      /*  for(integer i =0 ; i< 40; i++){
            system.enqueuejob( new queuable2());
        }  */ 
        
    }
     public void execute(queueableContext sc)
    {
             system.debug('line 11');   
    }
   // public class batchables implements database.batchable<sobject>
        public database.queryLocator start(database.batchableContext bc)
        {//   system.enqueuejob( new queuable2());
       // system.enqueuejob( new queuable2());
            return database.getQuerylocator('select id from account');
        }
        public void execute(database.batchableContext bc, list<account> acclist)
        {
            system.debug('line 16');
       //     system.enqueuejob( new queuable2());
          //  system.enqueuejob( new queuable2());
        }
        public void finish(database.batchableContext bc)
        {  system.debug('line 20');
        // system.enqueuejob( new queueableerror22());

        }
    
    public class queuable2 implements queueable{
        public void execute(queueablecontext qc)
        {  futurecalling.testw();futurecalling.testw();futurecalling.testw();futurecalling.testw();
            system.debug('line 24');
          //  system.enqueuejob( new queuable2());
        }
    }
 //   }
}