public class MySchedulerClass implements schedulable{
     public integer count ;
    public MySchedulerClass(integer counter)
    {
        this.count = counter;
    }
    public void execute(schedulablecontext sc )
    {      system.debug('line 8'+count);
            retrialLogic.logic1(count);       
    }

}