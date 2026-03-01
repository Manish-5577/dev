public class pastrecordanalysis implements database.batchable<sobject> {
    
    public database.querylocator start(database.batchablecontext bc )
    {
        return database.getQuerylocator('select id from account where lastmodifieddate < yesterday');
    }
    public void execute(database.batchablecontext bc , list<account> acclist)
    {
         
    }
    public void finish(database.batchablecontext bc)
    {
        
    }

}