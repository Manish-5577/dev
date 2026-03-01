trigger restrictOppforOpenCase on Opportunity (before insert) {
    
    set<id> acctId = new set<Id>();
    for(opportunity opp : trigger.new)
    {
        if(!string.isBlank(opp.accountId)){
            acctid.add(opp.accountid);
        }
    }
    if(acctid != null)
    {
          Map<id, account> accRelatedCaseMap = new  Map<id, account>([select id,(select id from cases where createddate = LAST_N_DAYS:10) from account where id in : acctid]);
              for(opportunity opp :trigger.new)
          {
              if(!string.isblank(opp.accountid)  &&  accRelatedCaseMap.get(opp.accountid) != null &&  accRelatedCaseMap.get(opp.accountid).cases.size() > 0 )
              {
                    opp.adderror('testing errorr');                  
              }
          }
    }
   

}