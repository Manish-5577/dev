public class pagination {
   
    @auraenabled(cacheable = true)
    public static list<opportunity> getoppTime()
    {
        return [select Id,closeDate,Name,AccountId,createdDate,account.name from opportunity];
    }
    
    @auraenabled(cacheable = false)
    public static void upsertrec(list<childenrolee__c> upsertlist)
    {
         upsert upsertlist;
    }
    
     @auraenabled(cacheable = true)
    public static list<account> getacctData()
    {
        return [select Id,Name from account];
    }
    
       @auraenabled(cacheable = true)
    public static list<opportunity> getchildRecopp(string accId )
    {
        return [select Id,closeDate,Name,createdDate,account.name from opportunity where accountid =:accId];
    }
     @auraenabled(cacheable = true)
    public static list<contact> getchildRec(string accId )
    {
        return [select Id,name,email from contact where accountid =:accId];
    }
    
    @auraenabled(cacheable = true)
    public static void  handleopp(list<opportunity> oppList)
    {  
        system.debug('line 144'+oppList);
        update oppList;
    }
    
    
    
    
    @auraenabled(cacheable = false)
    public static list<account> offsetApproach(integer offsets, integer limits)
    { system.debug('line 5'); return [select id,name from account  limit : limits  offset : offsets  ]; }

    
    @auraenabled(cacheable = true)
    public static list<contact> getContact()
    {
        return [select id,phone,email from contact  limit 10];
    }
    @auraenabled(cacheable = false)
    public static void updaterec()
    {
        contact cc = new contact();
        cc.id = '003gK000004tUWDQA2';
        cc.Email = 'testingnotifytoday@edgaaewqee.com';
        update cc;
    }
    
    @auraenabled(cacheable = true)
    public static list<case> getRelatedCase(string recordId)
    {
        return [select id,Origin,ContactEmail,Status from case where contactid =: recordId];
    }
    
   @auraenabled(cacheable=false)
    public static list<childenrolee__c> onloadingbeh(integer limits ,string ids)
    { string ss = 'select id,testing__c,Name from childenrolee__c limit 10';
        if(!string.isblank(ids))
        {
            ss = 'select id,testing__c,Name from childenrolee__c where id > : ids limit : limits';
        }
       return database.query(ss);
    }
    
  @auraenabled(cacheable= false)
   public static list<childenrolee__c>  getchildenrolee()
   {
       return [select id,testing__c,Name from childenrolee__c];
   }
    
    
    @auraenabled
    public static string testdate(string dateinput)
    {
        date mydate = Date.valueOf(dateinput);
        opportunity opp = new opportunity();
        opp.closedate = mydate;
        opp.name = 'closed opp';
        opp.stagename = 'closed won';
        insert opp;
        return 'successs !!!';
        
    }

    
    @auraenabled
      public static list<wrapperpick> picklisterapper()
      {    list<wrapperpick> wwlist = new list<wrapperpick>();
           Schema.DescribeFieldResult F = Account.Industry.getDescribe();
           List<Schema.PicklistEntry> P = F.getPicklistValues();
           for(Schema.PicklistEntry ss : p)
           {
               wrapperpick  ww = new wrapperpick();
               ww.label = ss.getLabel();
               ww.value = ss.getValue();
               wwlist.add(ww);
           }
       return wwlist;
      }
    
    public class wrapperpick
    {
         @auraenabled public string label;
         @auraenabled  public string value;
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}