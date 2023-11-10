public with sharing class ValidNumbers {    

    @AuraEnabled(cacheable=false)
    public static List<Valid_Number__c> getValidValues(String inputNumber) {
        Valid_Number__c validNumber = new Valid_Number__c();
        validNumber.Identification_Number__c = inputNumber;
        insert validNumber;
        
        return [select id,Name,Identification_Number__c from Valid_Number__c];

    }
}