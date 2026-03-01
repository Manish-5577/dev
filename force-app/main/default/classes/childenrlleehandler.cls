public class childenrlleehandler {
   public static boolean execute = true;
    public static  integer count =0;
    public static set<id> recordids = new set<id>();
     public static set<id> recordids2 = new set<id>();
   
    public static void test(list<childenrolee__c> childlist)
    { system.debug('line 5'); 
        for(childenrolee__c  childrec : childlist)
        {        if (recordids.contains(childrec.Id)) continue;
            childrec.testing__c = 'two';
           system.debug('childrec'+childrec);
           count++;
        }
     //  execute = false;
        system.debug('line 13');
      system.debug('count==>'+count);
   
    } 
    public static void testt2(list<childenrolee__c> childlist)
    {    System.debug('Set size: ' + recordids2.size());
        for( childenrolee__c cc : childlist)
        {
             if(!recordids2.contains(cc.id))
             {  recordids2.add(cc.id);
             }           
            }
     if(!recordids2.isempty()){
        list<childenrolee__c> listtoupdate = new list<childenrolee__c>();
        for(childenrolee__c cc : [select id from childenrolee__c where id in : recordids ])
        {   cc.testing__C = 'two';
            listtoupdate.add(cc);
        }
     update listtoupdate;
     }
    }
    
}