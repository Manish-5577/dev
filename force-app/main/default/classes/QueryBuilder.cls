public class QueryBuilder {

  
@auraenabled(cacheable = true)
public static List<wrapper> getAllObjectList()
{ 
    List<wrapper> objectNames = new List<wrapper>();
        // Get all sObject types
        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
        for (String sObjName : gd.keySet()) {
            Schema.SObjectType sObjType = gd.get(sObjName);
            Schema.DescribeSObjectResult dsr = sObjType.getDescribe();
            // Check if the user has read access to the object
            if (dsr.isAccessible()) {
                objectNames.add(new wrapper(dsr.getLabel(),dsr.getName())); 
            }
        }
      
        return objectNames;
    
}
    @auraenabled(cacheable = true)
    public static list<wrapperChild> getchildobjList(string objName)
    {  system.debug('objname'+objName);
        List<wrapperChild> wrpchildList = new List<wrapperChild>();
        Schema.SObjectType sObjType = Schema.getGlobalDescribe().get(objName);
        Schema.DescribeSObjectResult dsr = sObjType.getDescribe();
        List<Schema.ChildRelationship> childRelationships = dsr.getChildRelationships();
           for (Schema.ChildRelationship cr : childRelationships) {
            Schema.SObjectType childSObjectType = cr.getChildSObject();
            if (childSObjectType == null) continue; // Skip invalid relationships
            Schema.DescribeSObjectResult childDescribe = childSObjectType.getDescribe();
            String childApiName = childDescribe.getName();
            String childLabel = childDescribe.getLabel();
            if(childDescribe.isAccessible())
            {
                wrpchildList.add(new wrapperChild(childLabel,childApiName));
            }   
    }
     return wrpchildList;
    }
    
    public class wrapper{
      @auraenabled  public string label;
      @auraenabled  public string value;
        
        public wrapper(string label, string value)
        {
            this.label  = label;
            this.value = value;
        }
    }
    public class wrapperChild{
        @auraenabled public string label;
        @auraenabled public string value;
        public wrapperChild(String childobjLabel, string childobjValue )
        {
            this.label = childobjLabel;
            this.value = childobjValue;
        }
        
    }
    
}