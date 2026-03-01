({
	testLocker : function(component, event, helper) {       
       //   var childCmp = document.querySelector('c-lightninglockerchild');
              console.log('line 4444');  
 var childCmp = component.find("childCmp");
console.log('line 666',childCmp);  
        // get the DOM element of the child component
        var childDiv = childCmp.getElement().querySelector("#childDiv");
console.log('line 99999',childDiv); 
        // change the background color
        childDiv.style.backgroundColor = "red";
        childDiv.style.color = "white";

       console.log('line 1444'); 
      /*   console.log(document.querySelector("p")); // ❌ Blocked'
             var el = document.querySelector("p");
el.style.color = "red";
             console.log(el); // <p id="demo">Hello World</p>
console.log('line 3999from document api',el.textContent); // "Hello 
          console.log('line 112343242 parent');
         //console.log("msssg: ", component.find("msg").getElement());
        var el = component.find("msg").getElement();
        
        var btn = document.querySelector('lightning-button');
    console.log('line 1666');
// change background and text color
btn.style.backgroundColor = 'red';
btn.style.color = 'white';


       // el.style.color = "red";
   //     console.log('e11==>',e1);
       /*    console.log("msssg: ", component.find("msg").getElement());
        try {
            console.log(document.title); // ✅ Allowed (read-only)
        } catch(e) {
            console.error("Cannot read document.title:", e);
        }

        try {console.log('line 1888');
            console.log(document.querySelector("p")); // ❌ Blocked'
             var el = document.querySelector("p");
             console.log(el); // <p id="demo">Hello World</p>
console.log(el.textContent); // "Hello 
             console.log('line 20');
        } catch(e) {
            console.error("querySelector blocked:", e);
        }

        try {console.log('line 24');
            console.log(document.getElementById("msg")); // ❌ Blocked
             console.log('line 26');
        } catch(e) {
            console.error("getElementById blocked:", e);
        }

        try {console.log('line 30');
            document.body.appendChild(document.createElement("div")); // ❌ Blocked
             console.log('line 32');
        } catch(e) {
            console.error("Cannot append to body:", e);
        }console.log('line 411');
        var el = component.find("msg").getElement();
         console.log(e1);
console.log(el.textContent); // "Hello from DOM element"
*/
    },
})