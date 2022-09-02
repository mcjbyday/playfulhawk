public class RandomContactFactory {
    
    // contains one static method
    // accepts a number of contacts "numCons" and a last name string
    public static List<Contact> generateRandomContacts(Integer numCons, String lastNameStr) {

        List<Contact> listContacts = new List<Contact>();

        // loop creates specified number of contacts and stores them in the listContacts list var
        for(Integer i=0;i<numCons;i++) {
            Contact c = new Contact(FirstName = 'Test '+i,LastName=lastNameStr);
            listContacts.add(c);
        }

        // Insert all contacts.
        if (listContacts.size() > 0) {
            insert listContacts;
        }

        // method returns the list of newly added contacts
        return listContacts;

    }
}