@istest public class queuablebehaviourtestclass {
  @istest  public static void test11()
    {
     List<account> acclist = new list<account>();
        
        for(integer i =0 ; i< 200;i++){
            account acc = new account();
            acc.name = 'acc'+ i;
            acclist.add(acc);
        }
        insert acclist;
        QueueableExample qq = new QueueableExample(acclist);
        system.enqueuejob(qq);
    /*    ProcessrecordviaChaining pp = new ProcessrecordviaChaining(acclist);
        pp.test11(10);
        system.enqueueJob(pp);*/
    }
}