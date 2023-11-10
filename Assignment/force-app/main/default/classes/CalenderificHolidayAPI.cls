    public with sharing class CalenderificHolidayAPI {
    
        private static final String CALENDARIFIC_API_URL = 'https://calendarific.com/api/v2/holidays';
        private static final String API_KEY = '24c5e86734eb44dc4a962826324a5546e74dc42f';

    @AuraEnabled(cacheable = false)
    public static List<Holidays__c> getHolidays(Integer year) {
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint(CALENDARIFIC_API_URL + '?country=ZA&year=' + year);
        request.setMethod('GET');
        request.setHeader('Accept', 'application/json');
        request.setHeader('Authorization', 'Bearer ' + API_KEY);

        Http http = new Http();
        HttpResponse response = http.send(request);

        // if (response.getStatusCode() == 200) {
            Map<String,Object>results=(Map<String,Object>) json.deserializeUntyped(response.getBody());
            System.Debug('Check Json: ' +results);
            List<Holidays__c> hoList = new List<Holidays__c>();
            String responseBody = response.getBody().replaceAll('date', 'calendarDate');
            CalendarResponse calResponse = (CalendarResponse) JSON.deserialize(responseBody, CalendarResponse.class);
            
            for (CalendarResponse.Holiday s : calResponse.response.holidays) {
                Holidays__c ho = new Holidays__c();
                ho.Name = s.Name;
                Integer years = s.calendarDate.calendarDateTime.Year;
                Integer month = s.calendarDate.calendarDateTime.Month;
                Integer day = s.calendarDate.calendarDateTime.Day;
                ho.Date__c = Date.newInstance(years,month,day);
                System.Debug('Check JSON data' +ho);
                hoList.add(ho);
            }
            //insert hoList;
            System.Debug('Check JSON PARSE' +hoList);
            return hoList;
        
    }
}
            

    