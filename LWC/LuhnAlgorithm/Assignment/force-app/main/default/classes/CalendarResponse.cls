//
//Generated by AdminBooster
//

public class CalendarResponse{
	public ResponseMeta meta;
	public ResponseBody response;
	public class ResponseMeta {
		public Integer code;	//200
	}
	public class ResponseBody {
		public List<Holiday> holidays;
	}
	public class Holiday {
		public String name;	//New Year's Day
		public String description;	//New Year’s Day is celebrated with a blend of both diversity and tradition in countries such as South Africa on January 1 each year.
		public Country country;
		public CalendarDate calendarDate;
		public List<String> type;
		public String primary_type;	//Public Holiday
		public String canonical_url;	//https://calendarific.com/holiday/south-africa/new-year-day
		public String urlid;	//south-africa/new-year-day
		public String locations;	//All
		public String states;	//All
	}
	public class Country {
		public String id;	//za
		public String name;	//South Africa
	}
	public class CalendarDate {
		public String iso;	//1992-01-01
		public CalendarDateTime calendarDateTime;
	}
	public class CalendarDateTime {
		public Integer year;	//1992
		public Integer month;	//1
		public Integer day;	//1
	}

	public static CalendarResponse parse(String json){
		return (CalendarResponse) System.JSON.deserialize(json, CalendarResponse.class);
	}

}