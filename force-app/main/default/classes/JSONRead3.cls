public class JSONRead3 {
    
    
    public static void jsontest()
    {  integer counter = 1;List<Map<string,wrapper>> datawrapper = new List<Map<string,wrapper>>();Map<string,wrapper> ss = new map<string,wrapper>();
      for(account acc : [SELECT Id, Name,
                   (SELECT Id FROM Contacts),
                   (SELECT Id FROM Cases)
            FROM Account
            WHERE Id IN ('001gK00000IGgOKQA1','001gK00000YVxXRQA1')
        ])
      {   wrapper ww = new wrapper(acc.name,acc.Contacts.size(), acc.contacts, acc.cases.size(), acc.cases);
          ss.put('data'+counter, ww);
          counter++;
      }
     accountWrapper aw = new accountWrapper();
     datawrapper.add(ss);
     aw.datamap =datawrapper;
    // String json = JSON.serializePretty(aw);
 //String json2 = JSON.serialize(aw);

///    // string json2 = JSON.serialize(aw);
    // System.debug(json.length());
    // system.debug('json2'+ json2.length());
    }
    
    public class accountWrapper{
        public list<Map<string,wrapper>> datamap;
    }

       public class wrapper {
        public String accountName;
        public Integer contactCount;
        public List<Contact> contactlist;
        public Integer casecount;
        public List<Case> caseList;

        public wrapper(String accname, Integer contactcount,
                       List<Contact> con, Integer casecon,
                       List<Case> casList) {

            this.accountName = accname;
            this.contactCount = contactcount;
            this.contactlist = con;
            this.casecount = casecon;
            this.caseList = casList;
        }
    }

}