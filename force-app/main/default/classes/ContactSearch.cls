public class ContactSearch {
	
    //given last name of contact and a mailing postal code
    public static Contact[] searchForContacts(String lastName, String postalCodeStr) {
    //gets the ID and Name of those contacts        
	Contact[] contactsWithNameOrPostalCode = [SELECT Id, Name FROM Contact WHERE (LastName=:lastName OR MailingPostalCode=:postalCodeStr)];
    //return the ID and Name of those contacts
    //
    System.debug('Name of first associated contact: ' 
                     + contactsWithNameOrPostalCode[0].Name);
    System.debug('Name of first associated contact: ' 
                     + contactsWithNameOrPostalCode[0].Name);
    return contactsWithNameOrPostalCode;
    
    }

}