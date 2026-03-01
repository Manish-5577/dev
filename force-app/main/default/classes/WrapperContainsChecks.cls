public class WrapperContainsChecks {
   public class AddressWrapper {
    public String street;
    public String city;
    public String state;
    public String country;

    public AddressWrapper(String street, String city, String state, String country) {
        this.street  = street;
        this.city    = city;
        this.state   = state;
        this.country = country;
    }

    // -----------------------------
    // OVERRIDE EQUALS METHOD
    // -----------------------------
    public Boolean equals(Object other) {
        if (other instanceof AddressWrapper) {

            AddressWrapper o = (AddressWrapper) other;

            // Compare field-by-field
            return this.street  == o.street &&
                   this.city    == o.city &&
                   this.state   == o.state &&
                   this.country == o.country;
        }
        return false;
    }

    // -----------------------------
    // OVERRIDE HASHCODE METHOD
    // -----------------------------
    public Integer hashCode() {
        // Composite key
        String key = street + '|' + city + '|' + state + '|' + country;
        return key.hashCode();
    }
}

}