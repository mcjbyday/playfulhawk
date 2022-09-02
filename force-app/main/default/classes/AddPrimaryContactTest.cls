@isTest
public class AddPrimaryContactTest {
    @testSetup
    static void setup() {
        List<Account> accounts = new List<Account>();
        // add 50 accounts in CA in i dim
        for (Integer i = 0; i < 50; i++) {
            if (i < 50) {
                accounts.add(new Account(
                    name='Test Account '+i, BillingState='CA'
                ));
            }
            else {
                accounts.add(new Account(
                name='Test Account '+i, BillingState='NY'
            ));
            }
        }
        
        insert accounts;
    }
    static testmethod void testQueueable() {
        // query for test data to pass to queueable class
		Contact caContact = new Contact(FirstName='caFirst',LastName='caLast');
        // private Contact nyContact = new Contact(FirstName='nyFirst',LastName='nyLast'));
        
        // List<Account> accountsCA = [select id, name from account where BillingState = 'CA'];
		// List<Account> accountsNY = [select id, name from account where BillingState = 'NY'];

        // Create our Queueable instance
        AddPrimaryContact caConAdd = new AddPrimaryContact(caContact, 'CA');
        // AddPrimaryContact nyConAdd = new UpdateParentAccount(accountsny, nyContact);
        // startTest/stopTest block to force async processes to run
        Test.startTest();
        System.enqueueJob(caConAdd);
        Test.stopTest();
        // Validate the job ran. Check if new accounts in CA
        System.assertEquals(50, [select count() from Contact]);
    }
}