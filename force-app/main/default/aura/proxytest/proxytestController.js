({
	/*  test : function(cmp) {
        const raw = { msg: 'Locker Test' };
        console.log('RAW:', raw);

        cmp.set('v.data', raw);
        const secured = cmp.get('v.data');
console.log('line 88');
        console.log('SECURED:', secured);
     //  console.log('line 10',secured.__proto__)  
     console.log('line 11');
console.log('line 122',secured.isPrototypeOf);
          console.log('line 13raw',raw.isPrototypeOf);


    }*/
     peekInDom: function (cmp, event, helper) {
         let test = 'abc'; console.log('li22131');
       //  delete test;
    console.log("cmp.getElements(): ", cmp.getElements());
    // access the DOM in c:domLocker
    console.log('lineo980980');
       obhj = {p1: 20, p2:45};
          console.log('line 24');
    console.log("div1: ", cmp.find("div1").getElement());
    console.log("button1: ", cmp.find("button1"));
    console.log("button name: ", event.getSource().get("v.name"));

    // returns an error only with Locker, but not with Lightning Web Security
  // console.log("button1 element: ", cmp.find("button1").getElement());
         eval('console.log("This will not work")',test); // Throws an error

  },
})