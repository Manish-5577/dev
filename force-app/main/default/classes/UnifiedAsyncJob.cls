global class UnifiedAsyncJob 
    implements Schedulable, Database.Batchable<SObject>,queueable {
public void execute(queueablecontext qc)
            {

            }
    /*
     * ==============================
     * 1️⃣ Scheduler Method
     * ==============================
     */
    global void execute(SchedulableContext sc) {
        // When scheduled → start batch
        Database.executeBatch(this, 200);
        System.enqueueJob(new abc());  
    }

    /*
     * ==============================
     * 2️⃣ Batch Methods
     * ==============================
     */

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, Name FROM Account limit 1'
        );
    }

    global void execute(Database.BatchableContext bc, List<Account> scope) {
        for (Account acc : scope) {
            acc.Description = 'Processed by Batch';
        }
        update scope;
    }

    global void finish(Database.BatchableContext bc) {
        // After batch finishes → call queueable
       // System.enqueueJob(this);
    }

    /*
     * ==============================
     * 3️⃣ Queueable Method
     * ==============================
     */
        public class abc implements queueable{
            public void execute(queueablecontext qc)
            {

            }
        }
}