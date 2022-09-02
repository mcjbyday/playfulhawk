public class LeadProcessor implements
    Database.Batchable<sObject>, Database.Stateful {
    // instance member to retain state across transactions
    public Integer recordsProcessed = 0;
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID, Name, LeadSource FROM Lead'
        );
    }
    public void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        List<Lead> leads = new List<Lead>();
        
        for (Lead lead : scope) {
            lead.LeadSource = 'Dreamforce';
            // add lead to list to be updated
            leads.add(lead);
            // increment the instance member counter
            recordsProcessed = recordsProcessed + 1;
        }

        update leads;
    }
    public void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. let\'s go!');
    }
}