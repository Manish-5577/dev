public class FoodOptionpart2 {
    /**
     * Invocable method to get all Food_Option__c records with specified fields
     * @return List of FoodOptionResponse containing wrapped food options data
     */
    @InvocableMethod(label='Get Food Options' description='Retrieves all Food Options with their details')
    public static List<FoodOptionResponse> getFoodOptions(List<String> foodPreferences) {
        List<FoodOptionResponse> responses = new List<FoodOptionResponse>();
        
        // Query all food options
        List<Food_Option__c> foodOptions = [
            SELECT Name, Price__c, Size__c, Part_of_Buffet__c, Type__c
            FROM Food_Option__c 
        ];
        
        // Create wrapper response
        FoodOptionResponse response = new FoodOptionResponse();
        response.foodOptions = new FoodOptions();
        response.foodOptions.foodOptions = new List<FoodOption>();
        
        // Convert Food_Option__c records to wrapper objects
        for(Food_Option__c food : foodOptions) {
            FoodOption foodOption = new FoodOption(
                food.Name,
                String.valueOf(food.Price__c),
                food.Size__c,
                food.Part_of_Buffet__c,
                food.Type__c
            );
            response.foodOptions.foodOptions.add(foodOption);
        }
        
        responses.add(response);
        return responses;
    }
    
    
    /**
     * Wrapper class for the response containing list of food options
     */
    public class FoodOptionResponse {
        @InvocableVariable
        public FoodOptions foodOptions;
    }

    /**
     * Wrapper class for the food options list
     */
    public class FoodOptions {
        @InvocableVariable
        public List<FoodOption> foodOptions;
    }
    
    /**
     * Wrapper class for individual food option details
     */
    public class FoodOption {
        @InvocableVariable
        public String name;
        
        @InvocableVariable
        public String price;
        
        @InvocableVariable
        public String size;
        
        @InvocableVariable
        public Boolean partOfBuffet;
        
        @InvocableVariable
        public String type;
        
        public FoodOption(String name, String price, String size, Boolean partOfBuffet, String type) {
            this.name = name;
            this.price = price;
            this.size = size;
            this.partOfBuffet = partOfBuffet;
            this.type = type;
        }
    }
}
  /*  
    @invocableMethod(label = 'Generate Food Option Response')
    public static List<foodoptionlist> getfoodoption(list<inputreq> inputReq)
    {    List<foodoptionrecord> foodlist = new list<foodoptionrecord>();
     list<foodoptionlist> finalfood = new list<foodoptionlist>();
     FoodOptionpart2.finalfoodresponse finalresponobj = new  FoodOptionpart2.finalfoodresponse();
     FoodOptionpart2.foodoptionlist foodresponselistobject = new FoodOptionpart2.foodoptionlist();
        for(Food_Option__c fo : [select id,Part_of_Buffet__c,Price__c,Size__c,Type__c,Name	 from Food_Option__c])
        {
             foodoptionrecord forec = new foodoptionrecord();
              forec.size = fo.size__c;
              forec.Types = fo.Type__c;
              forec.Price = (Integer)fo.Price__c;
              forec.PartofBuffet = fo.Part_of_Buffet__c;
              forec.Name =  fo.Name;
              foodlist.add(forec);
        }
        foodresponselistobject.foodoptionrecords = foodlist;
     finalresponobj.finalresponse = foodresponselistobject;
         
         return finalfood;
    }
    
    public class finalfoodresponse{
         @invocablevariable
        public foodoptionlist finalresponse;
    }
    public class foodoptionlist{
        @invocablevariable
        public list<foodoptionrecord> foodoptionrecords;
    }
    public class foodoptionrecord{
        @invocablevariable
        public string size ;
          @invocablevariable
        public string Types ;
          @invocablevariable
        public Integer Price ;
         @invocablevariable
        public boolean PartofBuffet ;
          @invocablevariable
        public string Name ;  
    }
    public class inputreq{
         @invocablevariable
        public string name;
    }
    
*/