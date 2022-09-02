public class AddPrimaryContact implements Queueable {

    // Create a Queueable Apex class that inserts the same Contact for each Account for a specific state. 
    // get and store accounts of interest with a specific state
    // insert the same contact for each account with a specific state
    
    // somewhere I got a contact info that was relevant to the change 
    // 
    // private List<Account> accounts;
    private Contact primaryContact;
    private String state;
    public AddPrimaryContact(Contact contact, String stateOfBilling) {
        // this.accounts = records;
        this.primaryContact = contact;
        this.state = stateOfBilling;
    }
    
    public void execute(QueueableContext context) {
        List<Contact> listContacts = new List<Contact>();
        
        for (Account account : [SELECT Id,Name FROM Account
        WHERE BillingState = :state]) {
			Contact conInst = primaryContact.clone(false,false,false,false);
            conInst.AccountId = account.Id;
            
            listContacts.add(conInst);
        }
        // DML database update with newly assigned primary contact
        insert listContacts;
    }
    
    
}