public class JSONRead2 {


    public static void wrapertest() {

        Map<String, wrapper> dataMap = new Map<String, wrapper>();
        Integer counter = 1;

        for (Account acc : [
            SELECT Id, Name,
                   (SELECT Id FROM Contacts),
                   (SELECT Id FROM Cases)
            FROM Account
            WHERE Id IN ('001gK00000IGgOKQA1','001gK00000YVxXRQA1')
        ]) {

            wrapper ww = new wrapper(
                acc.Name,
                acc.Contacts.size(),
                acc.Contacts,
                acc.Cases.size(),
                acc.Cases
            );

            dataMap.put('data' + counter, ww);
            counter++;
        }

        AccountWrapper outerr = new AccountWrapper();
        outerr.accountWrapper = dataMap;

        String json = JSON.serializePretty(outerr);
        System.debug(json);
    }

    // 🔹 OUTER wrapper
    public class AccountWrapper {
        public Map<String, wrapper> accountWrapper;
    }

    // 🔹 INNER wrapper
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