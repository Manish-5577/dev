public class queueableerror implements queueable, database.allowscallouts,Finalizer{

    public void execute(QueueableContext qc) {
             // System.enqueueJob(new QueueableError22());
        try{
           // integer ii = 97/0;
              //Instantiating a new CreateAccountsQueueable class for Finalizer interface
        Finalizer finalizerInstance = new queueableerror();

        //Attaching the Finalizer with Queueable interface
        System.attachFinalizer(finalizerInstance);

            for(integer i =0 ; i<1000000000;i++)
            {
                
            }
            for(integer i =0 ; i<1000000000;i++)
            {
                
            }
            for(integer i =0 ; i<1000000000;i++)
            {
                
            }
        }catch(exception ee)
        {
          system.debug('line 9');          
        }  
    }
      public void execute(FinalizerContext ctx) {
    String parentJobId = '' + ctx.getAsyncApexJobId();
    System.debug('Begin: executing finalizer attached to queueable job: ' + parentJobId);
    if (ctx.getResult() == ParentJobResult.SUCCESS) {
        System.debug('Parent queueable job [' + parentJobId + '] completed successfully.');
    } else {
      system.debug('how many times line 38 executed!!');
        system.enqueuejob(new queueableerror());
    }
    System.debug('Completed: execution of finalizer attached to queueable job: ' + parentJobId);
  }
}