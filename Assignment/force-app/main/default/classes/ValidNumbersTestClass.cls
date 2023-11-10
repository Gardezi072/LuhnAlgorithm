@isTest
public with sharing class ValidNumbersTestClass {
    @isTest
    static void testGetValidValues() {
        String inputNumber = '1234567890123';

        List<Valid_Number__c> result = ValidNumbers.getValidValues(inputNumber);

        System.assertEquals(1, result.size());

        Valid_Number__c validNumber = result[0];
        System.assertEquals(inputNumber, validNumber.Identification_Number__c);

        delete result;
    }
}