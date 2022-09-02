public class TestDataFactory {
    //contains one static method ... 
    // accepts a number of accounts "numAccts" and number related opps "numOppsPerAcct"

    public static List<Account> createAccountsWithOpps(Integer numAccts, Integer numOppsPerAcct) {
        List<Account> accts = new List<Account>();
        // loop creates specified number of accounts and stores them in the accts list var
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        // add this variable to the database via DML
        if (accts.size() > 0) {
            insert accts;
        }
        // loop creates opportunities. 
        // outer loop iterates through accounts, inner (nested) loop creates related opps for current acct
        List<Opportunity> opps = new List<Opportunity>();
        // total opportunities number created = numOppsPerAcct * numAccts
        for (Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];
            // For each account just inserted, add opportunities
            // Opportunities are linked to their parent accounts using the AccountId field
            for (Integer k=0;k<numOppsPerAcct;k++) {
                opps.add(new Opportunity(Name=acct.Name + ' Opportunity ' + k,
                                       StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=acct.Id));
            }
        }

        // Insert all opportunities for all accounts.
        if (opps.size() > 0) {
            insert opps;
        }
        // method returns the list of newly added accounts
        return accts;
    }
}