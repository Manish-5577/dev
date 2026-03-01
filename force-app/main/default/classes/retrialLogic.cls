public class retrialLogic {
    
    public static void logic1(integer counter)
    {
        try{
             account acc = new account();
             acc.name = 'retrial testing';
             acc.Industry = 'Agriculture';
            insert acc;
        }
        catch(exception ee)
        {  counter++;
         if(counter < 4){
          Datetime dt = Datetime.now().addSeconds(10);
Integer sec = dt.second();
Integer min = dt.minute();
Integer hour = dt.hour();
Integer day = dt.day();
Integer month = dt.month();
Integer year = dt.year();

String cronExp = sec + ' ' + min + ' ' + hour + ' ' + day + ' ' + month + ' ? ' + year;
System.debug('CRON expression: ' + cronExp);
// CRON expression ignores seconds — earliest it can schedule is the next minute
//String cron = '0 ' + dt.minute() + ' ' + dt.hour() + ' ' + dt.day() + ' ' + dt.month() + ' ? ' + dt.year();
System.schedule('MyJob'+cronExp, cronExp, new MySchedulerClass(counter));
         }
        }
    }
    public static void test()
    {  list<wrapper> ww = new list<wrapper>();
        for(account acc : [select id,name from account limit 5])
        {
            wrapper w1 = new wrapper();
            w1.abc= acc.name;
            w1.xyz = acc.id;
            ww.add(w1);
        }
      system.debug('line 39'+ ww);
    }
    public class wrapper{
        public string abc;
        public string xyz;
         public wrapper()
         {
             this.abc = '';
             this.xyz = '';
         }
    }

}