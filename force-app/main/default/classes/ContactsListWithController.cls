public with sharing class ContactsListWithController {
    // the name of the field to sort the contacts by (a private member variable, a string named sortOrder)
    private String sortOrder = 'LastName';
    // one public method, getContacts(). 
    // The effect of the method is to perform a SOQL query to get a list of contact records, and then return that list of contacts to the method caller
    public List<Contact> getContacts() {
        List<Contact> results = Database.query(
            'SELECT Id, FirstName, LastName, Title, Email ' +
            'FROM Contact ' +
            'ORDER BY ' + sortOrder + ' ASC ' +
            'LIMIT 10'
        );
        return results;
    }

    public void sortByLastName() {
        this.sortOrder = 'LastName';
    }
    public void sortByFirstName() {
        this.sortOrder = 'FirstName';
    }
    
}