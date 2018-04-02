package model;

import java.util.Date;

public class CalendarVO {

	private int num;
	private int studynum;
	private String title;
	private String description;
	private String startdate;
	private String enddate;
	private Date rdate;
	private String place;
	
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getStudynum() {
		return studynum;
	}
	public void setStudynum(int studynum) {
		this.studynum = studynum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	@Override
	public String toString() {
		return "CalendarVO [num=" + num + ", studynum=" + studynum + ", title=" + title + ", description=" + description
				+ ", startdate=" + startdate + ", enddate=" + enddate + ", rdate=" + rdate + ", place=" + place + "]";
	}
	
	

	
}
