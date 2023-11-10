@isTest
public with sharing class CalenderificHolidayAPITestClass {
    @isTest
    static void testGetHolidays() {
        
        Test.startTest();

        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());

        List<Holidays__c> result = CalenderificHolidayAPI.getHolidays(2023);

        System.assertEquals(2, result.size()); 

        Test.stopTest();
    }
    public class MockHttpResponseGenerator implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('{"response": {"holidays": [{"Name": "Holiday1", "date": {"calendarDateTime": {"Year": 2023, "Month": 1, "Day": 1}}}, {"Name": "Holiday2", "date": {"calendarDateTime": {"Year": 2023, "Month": 12, "Day": 25}}}]}}');
            res.setStatusCode(200);
            return res;
        }
    }
}