@isTest
public class DailyLeadProcessorTest {
	
    private static String CRON_EXP = '0 0 0 ? * * *'; // midnight every day
    
    @isTest
    private static void testSchedulableClass() {
        
        List<Lead> leads = new List<Lead>(); 
        
        for (Integer i = 0; i < 500; i++) {
            if (i < 250) {
                leads.add(new Lead(LastName='Chippy'+i, Company='Salesforce'));
            }
            else {
                leads.add(new Lead(LastName='Chippy'+i, Company='Salesforce', LeadSource='Diggeridoo'));            
            }
        }
        
        insert leads;
    
    
    //perform the test
    Test.startTest();
    String jobId = System.schedule('Process Leads', CRON_EXP, new DailyLeadProcessor());
    Test.stopTest();
    
    // check the result
    List<Lead> updatedLeads = [SELECT Id,LastName,Company FROM lead WHERE LeadSource = 'Diggeridoo'];
    System.assertEquals(200, updatedLeads.size(),'ERROR: At least 1 record not updated properly');
    
    // check scheduled time
    List<CronTrigger> cts = [Select Id, TimesTriggered, NextFireTime FROM CronTrigger WHERE Id = :jobId];
    System.debug('Next fire time '+ cts[0].NextFireTime);
    }
}