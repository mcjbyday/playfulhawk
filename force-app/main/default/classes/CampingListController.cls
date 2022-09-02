public with sharing class CampingListController {
    @AuraEnabled
    public static List<Camping_Item__c> getCampingItem(){
        try {
            return [SELECT Name, Quantity__c, Price__c, Packed__c
                FROM Camping_Item__c];

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static string saveCampingItem(Camping_Item__c campItem){
        try {
            upsert campItem;
            return campItem;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
