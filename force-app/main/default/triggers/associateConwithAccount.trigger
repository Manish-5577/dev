trigger associateConwithAccount on Contact (after insert) {
    Map<id,account> conIdAccMap = new map<id,account>();
    for(contact cc : trigger.new)
    {   if(string.isBlank(cc.accountId))
         {
             account acc = new account();
             acc.name = cc.lastname; 
             conIdAccMap.put(cc.id, acc);
         }
    }
    if(conIdAccMap != Null){
        insert conIdAccMap.values();
    }
    

}