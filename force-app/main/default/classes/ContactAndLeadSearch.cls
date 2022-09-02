public class ContactAndLeadSearch {

    //given last name of contact and a mailing postal code
    public static List<List<sObject>> searchContactsAndLeads(String param) {

    //gets the ID and Name of those contacts        
    List<List<sObject>> searchListResults = [FIND :param IN ALL FIELDS RETURNING Contact(FirstName,LastName), Lead(FirstName,LastName)];
    
    //return the ID and Name of those contacts
    return searchListResults;
    
    }


    
}