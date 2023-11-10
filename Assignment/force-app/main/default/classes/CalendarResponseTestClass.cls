@isTest
public with sharing class CalendarResponseTestClass {
    @isTest
    static void testParse() {
        String json = '{"meta": {"code": 200},"response": {"holidays": [{"name": "New Year\'s Day","description": "New Year’s Day is celebrated with a blend of both diversity and tradition in countries such as South Africa on January 1 each year.","country": {"id": "za","name": "South Africa"},"calendarDate": {"iso": "1992-01-01","calendarDateTime": {"year": 1992,"month": 1,"day": 1}},"type": ["Type1", "Type2"],"primary_type": "Public Holiday","canonical_url": "https://calendarific.com/holiday/south-africa/new-year-day","urlid": "south-africa/new-year-day","locations": "All","states": "All"}]}}';

        CalendarResponse result = CalendarResponse.parse(json);

        System.assertEquals(200, result.meta.code);
        System.assertEquals(1, result.response.holidays.size());

        CalendarResponse.Holiday holiday = result.response.holidays[0];
        System.assertEquals('New Year\'s Day', holiday.name);
        System.assertEquals('New Year’s Day is celebrated with a blend of both diversity and tradition in countries such as South Africa on January 1 each year.', holiday.description);
    }

}