public class JSONRead {
    
    public static List<wrapper> wrappermain;
    public static void wrapertest()
    {List<wrapper> wrapList = new List<wrapper>();
        for(account acc : [select id,name,(select id from cases),(select id from contacts) from account where id in ('001gK00000IGgOKQA1','001gK00000YVxXRQA1')])
        {
            wrapper ww = new wrapper(acc.name,acc.contacts.size(),acc.contacts, acc.cases.size(), acc.cases);
            wrapList.add(ww);
        }
    // JSONRead.wrappermain = wrapList;
     String json = JSON.serialize(wrapList); 
    // string json =  JSON.serializePretty(wrapList);
     system.debug(json.length());
    }
    public class wrapper{
        public string accountName;
        public Integer contactCount;
        public list<contact> contactlist;
        public Integer casecount;
        public list<case> caseList;
        public wrapper(string accname, integer contactcount, list<contact> con, integer casecon, list<case> casList)
        {
           this.accountName = accname;
           this.contactCount = contactcount;
           this.contactlist = con;
           this.casecount = casecon;
           this.caseList = casList;
        }
    }

}