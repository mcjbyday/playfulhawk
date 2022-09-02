({
	packItem: function(component, event, helper) {
        let btnClicked = event.getSource();         // the button
        btnClicked.set("v.disabled",true);
        //let btnMessage = btnClicked.get("v.label"); // the button's label
        component.set("v.item.Packed__c", true);     // update our message
    }


})