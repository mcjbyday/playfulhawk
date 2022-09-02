trigger AddRelatedRecordTrigger on Account (before insert) {
    
    List<Opportunity> oppList = new List<Opportunity>();
    
    // Get the related opportunities for the accounts in this trigger
    // 
    // As an after trigger, affected records are already committed to database. 
    // Let’s write a SOQL query that returns all accounts in this trigger that don’t have related opportunities. 
    //Map<Id,Account> acctsWithOpps = new Map<Id,Account>(
    //    [SELECT Id,Name FROM Account WHERE Id IN :Trigger.New AND
    //                                     Id NOT IN (SELECT AccountId FROM Opportunity)]);
    // Exclude accounts that already have a related opportunity.
    for(Account a : [SELECT Id,Name FROM Account 
                     WHERE Id IN :Trigger.New AND
                     Id NOT IN (SELECT AccountId FROM Opportunity)]) {
                        
                         // Add an opportunity for each account if it doesn't already have one.
                         // Iterate through each account.
                         // System.debug('acctsWithOpps.get(a.Id).Opportunities.size()=' + acctsWithOpps.get(a.Id).Opportunities.size());
                         // Add a default opportunity
                         oppList.add(new Opportunity(Name=a.Name + ' Opportunity',
                                                     StageName='Prospecting',
                                                     CloseDate=System.today().addMonths(1),
                                                     AccountId=a.Id));
                         
                     }
    
    if (oppList.size() > 0) {
        insert oppList;
    }    
    
    
}