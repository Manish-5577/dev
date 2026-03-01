public class casehandler {

    @auraenabled(cacheable = true)
    public static list<contact> abcc()
    {
            system.debug('case count handler'+[select id from case user_mode].size());
          return [select id,Name from contact];
    }
}