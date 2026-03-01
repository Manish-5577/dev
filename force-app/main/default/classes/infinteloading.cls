public class infinteloading {

    
    @auraenabled
    public static list<case> getinfiniteoading(string caseId)
    {  string soqlqury = '';
      if(string.isBlank(caseId))
      {
          soqlqury = 'select id from case limit 10';
              }
     else{
                  soqlqury = 'select id from case where id >  '+ '\'' + caseId + '\'';
              }
        return database.query(soqlqury);
    }
}