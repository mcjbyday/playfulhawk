({
    clickCreateItem: function(component, event, helper) {
        let validItem = component.find('itemform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validItem){
            // Create the new expense
            let newItem = component.get("v.newItem");
            console.log("Create expense: " + JSON.stringify(newItem));
            let theItems = component.get("v.items");
            
            theItems.push(newItem);
            component.set("v.items", theItems);
            
            component.set("v.newItem",{'sobjectType':'Camping_Item__c',
                'Name': '',
                'Quantity__c': 0,
                'Price__c': 0,
                'Packed__c': false});
            //helper.createExpense(component, newItem);
            // Copy the expense to a new object
            // THIS IS A DISGUSTING, TEMPORARY HACK
            // let newExpense = JSON.parse(JSON.stringify(expense));
            // console.log("Expenses before 'create': " + JSON.stringify(theItems));
            // console.log("Expenses after 'create': " + JSON.stringify(theItems));
        }
    }
})