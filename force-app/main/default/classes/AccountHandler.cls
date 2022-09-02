public class AccountHandler {

    public static Account insertNewAccount(String uniqueValue) {
        


        try {
            // This causes an exception because 
            //   the required Name field is not provided.
            //Account ourGuy = new Account(Name=uniqueValue)
            // Insert the account 
            // 
			Account ourGuy = new Account(Name=uniqueValue);
            insert ourGuy;
            return ourGuy;
        } catch (DmlException e) {
            // System.debug('A DML exception has occurred: ' +
            //             e.getMessage());
            return null;
        }
        
    }
    
}