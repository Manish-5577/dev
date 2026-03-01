public class ProcessrecordviaChaining implements Queueable, Database.AllowsCallouts{
    
   private list<account> rectoProcesList;
   private integer chunksize ;
   
   public  ProcessrecordviaChaining(list<account> acclist)
   {
       this.rectoProcesList = acclist;
   }
     public  ProcessrecordviaChaining test11(Integer chunksize)
   {
       this.chunksize = chunksize;
      return this;
   }
    public void execute(queueablecontext qc)
    {system.debug('line 16==>');
        integer counter = 0; processrecordhelper  pp1 = new processrecordhelper();
     while(counter < chunksize &&  rectoProcesList != null && rectoProcesList.size() > 0){
           if(rectoProcesList != null && rectoProcesList.size() > 0) 
           {   account acc = rectoProcesList.remove(0);           
               pp1.processrecord(acc);
            counter ++;
           }
     }
      if(!test.isRunningtest() &&  rectoProcesList.size() > 0 )
      { ProcessrecordviaChaining pp = new ProcessrecordviaChaining(rectoProcesList);
       pp.test11(10);
       system.enqueueJOb(pp);
      }
    }
    

}