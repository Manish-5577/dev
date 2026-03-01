public class queueableerror22  implements queueable {
     
    public void execute(queueablecontext qc)
    {
        system.debug('line 44 executed');
   //     insert new account(name = 'queuwabe creation');
        system.enqueueJob(new queueable33());
    }
}