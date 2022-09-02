public with sharing class NewCaseListController {
    
    // one public method, getNewCases(). 
    // The effect of the method is to perform a SOQL query to get a list of case records, and then return that list of cases to the method caller

    public List<Case> getNewCases() {
        List<Case> results = [SELECT Id, CaseNumber FROM CASE WHERE Status='New'];
        // List<Case> results = Database.query(
        //     'SELECT Id, CaseNumber' +
        //     'FROM Case ' +
        //     'WHERE Status=\'New\''
        // );
        return results;
    }
    
}