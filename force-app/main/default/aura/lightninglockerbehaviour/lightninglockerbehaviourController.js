({
	 peekInDom : function(cmp, event, helper) {
      /*  var cmp = component.find("div1"); // container div

        // Fallback if container not found
        var element;
        if (cmp) {
            element = component.getElement();
        } else {
            element = component.getElement();
        }

        // Query all child boxes
        var boxes = element.querySelectorAll(".box");
        console.log("Boxes:", boxes);*/
    
        
    console.log("cmp.getElements(): ", cmp.getElements());
    // access the DOM in c:domLocker
    console.log("div1: ", cmp.find("div1").getElement());
    console.log("button1: ", cmp.find("button1"));
    console.log("button name: ", event.getSource().get("v.name"));
        // Find the button using aura:id
        var btnCmp = cmp.find("button1");

        // If multiple (rare case), handle array
        if (Array.isArray(btnCmp)) {
            btnCmp = btnCmp[0];
        }

        // Get label attribute
        var labelValue = btnCmp.get("v.label");

        console.log("Button Label:", labelValue);
    

     }
    // returns an error only with Locker, but not with Lightning Web Security
 //   console.log("button1 element: ", cmp.find("button1").getElement());
 //   
 /*     var divCmp = cmp.find("div1");

        console.log("Find result:", divCmp);

        if (!divCmp) {
            console.log("div1 not found");
            return;
        }

        // If multiple, take first
        if (Array.isArray(divCmp)) {
            divCmp = divCmp[0];
        }

        // Get DOM element
        var element = divCmp.getElement();

        if (!element) {
            console.log("Element not rendered yet");
            return;
        }

        console.log("Aura ID:", divCmp.getLocalId());
        console.log("HTML ID:", element.id);
        console.log("Inner Text:", element.innerText);
        }
*/      
  
})