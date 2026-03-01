public virtual class protectedClassdemo {
    // public integer parentvar = 9;
 // protected variable
    protected String name = 'line 4';

    // protected method
    protected void speak() {
        System.debug('Animal makes a sound');
         system.debug(name);
         system.debug(this.name);
    }

    // Inner class CAN access protected members
    public class AnimalHelper {
  //     public string kk = name;
        public void show() {
            //name = 'Inner Animal';
           // speak();
      //   system.debug(name);
        }
    }

}