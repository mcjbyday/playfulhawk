public class AccountProcessor {
@future
	public static void countContacts(Set<Id> myIdSet) {
    // get a list of accounts, the id, their anumber of contacts, and the key value pair of contacts
    List<Account> accountList = [Select Id, Number_of_Contacts__c,(select id from Contacts) from Account Where (Id IN :myIdSet)];
        // iterate through this list, creating a local list of contacts on that account
        for (Account a : accountList) {
            List<Contact> contactList = a.contacts;
            //  assign the value of the Contact number to be the length of that list
            a.Number_of_Contacts__c = contactList.size();
        }
    // use DML to update the accounts in the organization to reflect this counter value on the objects
    update accountList;      
  }
 
}