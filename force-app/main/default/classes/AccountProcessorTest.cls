@isTest
private class AccountProcessorTest {
    //@isTest static void testSFDC() {
      //  Number SFDCContactCount = AccountProcessor.countContacts(0018c00002Sr9XUAAZ);
        //System.assertEquals(1,SFDCContactCount);
  //    }
  //  @isTest static void testUnitedOilGasCorp() {
    //    Number UOGCContactCount = AccountProcessor.countContacts(0018c00002Sr9XUAAZ);
      //  System.assertEquals(5,UOGCContactCount);
    //}
    public static testmethod void TestAccountProcessor(){
        Account a = new Account();
        a.Name = 'Test Account';
        Insert a;

        Contact cont = New Contact();
        cont.FirstName ='Uncle';
        cont.LastName ='Fester';
        cont.AccountId = a.Id;
        Insert cont;
       
        set<Id> setAccId = new Set<ID>();
        setAccId.add(a.id);
 
        Test.startTest();
            AccountProcessor.countContacts(setAccId);
        Test.stopTest();
       
        Account bigA = [select Number_of_Contacts__c from Account where id = :a.id LIMIT 1];
        System.assertEquals ( Integer.valueOf(bigA.Number_of_Contacts__c) ,1);
  }
}