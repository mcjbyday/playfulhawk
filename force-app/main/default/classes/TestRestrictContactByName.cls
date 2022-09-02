@isTest
public class TestRestrictContactByName {
	
    @isTest
    private static void testContactAddNameRestriction() {
        
        List<Contact> contacts = new List<Contact>(); 
        
        contacts.add(new Contact(LastName='INVALIDNAME',Department='Marketing'));            
        
        // Perform test
        Test.startTest();
        try {
            insert contacts;
        }
        catch (DMLException ex) {
            System.assert(ex.getMessage().contains('The Last Name "'+ contacts[0].LastName +'" is not allowed for DML'));
        }
        // Test.startTest();
        // Database.InsertResult result = Database.insert(contacts, false);
        // Test.stopTest();
        // Verify 
        // In this case the insertion should have been stopped by the trigger,
        // so verify that we got back an error.
        // System.assert(!result.isSuccess());
        // System.assert(result.getErrors().size() > 0);
        // System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', result.getErrors()[0].getMessage());
        
    }

    @isTest
    private static void testContactUpdateNameRestriction() {
        // need to try and update an existing contact with the invalid name
        List<Contact> contacts = new List<Contact>(); 

        for (Integer i = 0; i < 3; i++) {
            contacts.add(new Contact(LastName='Chippy '+i));
        }
        
        insert contacts;
        
        Contact contactToUpdate = [SELECT Id, LastName FROM Contact WHERE LastName = 'Chippy 2'];
        
        contactToUpdate.LastName = 'INVALIDNAME';

        // Perform test
        Test.startTest();
        try {
            update contactToUpdate;
        }
        catch (DMLException ex) {
            System.assert(ex.getMessage().contains('The Last Name "'+ contactToUpdate.LastName +'" is not allowed for DML'));
        }

        //Database.UpdateResult result = Database.update(contacts, false);
        Test.stopTest();
        // Verify 
        // In this case the update should have been stopped by the trigger,
        // so verify that we got back an error.
        // System.assert(!result.isSuccess());
        // System.assert(result.getErrors().size() > 0);
        // System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', result.getErrors()[0].getMessage());
                             
        
        
    }
    
    
    	

    
}