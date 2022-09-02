public without sharing class DailyLeadProcessor implements Schedulable {

    // executable. takes a context, returns a chron trigger = gets handle on timing of the runs
     public void execute(SchedulableContext ctx) {
        // awesome code here
        // //System.debug('Context'+)
        // find the first 200 Lead records with a blank LeadSource field 
        // update them with the LeadSource value of Dreamforce
        List<Lead> leads = [SELECT id, LeadSource FROM Lead WHERE LeadSource = null LIMIT 200];
         for (Lead l : leads) {
             l.LeadSource = 'Dreamforce';
         }
        //update modified records
         update leads;
    }
    
}