public class customlogicuniqueObj {
    
    public static void testuniqueadd()
    {  Map<string,list<id> > mm = new map<string,list<string>>();integer i =0;List<wrapperaddress> wwlist = new list<wrapperaddress>();
        for(contact cc : [select id,MailingCity,MailingCountry,MailingStreet,MailingPostalCode from contact order by createddate desc limit 8] )
        {string address = cc.MailingCity + '-' + cc.MailingCountry + '-' + cc.MailingStreet + '-' + cc.MailingPostalCode;
            if(mm.containskey(address)){
                mm.get(address).add(cc.id);
            }
            else{
                mm.put(address, new list<id>{cc.id});
                wrapperaddress  ww = new wrapperaddress(cc.MailingCity ,cc.MailingCountry,cc.MailingStreet, cc.MailingPostalCode );
                wwlist.add(ww);               
            }
        }
       system.debug(JSON.serialize(wwlist));
       for(string ss : mm.keyset())
       {
           system.debug(ss);
       }
    }
    
    public class wrapperaddress{
        public string city;
        public string country;
            public string street;
            public string postalcode;
            
        public wrapperaddress(string city , string country, string street , string postalcode)
        {
            this.city = city;
            this.country = country;
            this.street = street;
            this.postalcode = postalcode;
        }
    }

}