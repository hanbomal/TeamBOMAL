package model;

import java.sql.Date;

public class StudyVO {
	private int num;
	private String studyName;
	private int peopleCount; //현 인원수
	private String leader;
	private Date openDate;
	private String study_pro; //스터디 프로필
	private String study_back; //배경
	private String study_intro; //설명
	private int proSize;
	private int backSize;
	private RelationVO relation;
	
	public RelationVO getRelation() {
		return relation;
	}
	public void setRelation(RelationVO relation) {
		this.relation = relation;
	}
	public String getStudyName() {
		return studyName;
	}
	public void setStudyName(String studyName) {
		this.studyName = studyName;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPeopleCount() {
		return peopleCount;
	}
	public void setPeopleCount(int peopleCount) {
		this.peopleCount = peopleCount;
	}
	public String getLeader() {
		return leader;
	}
	public void setLeader(String leader) {
		this.leader = leader;
	}
	public Date getOpenDate() {
		return openDate;
	}
	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}
	public String getStudy_pro() {
		return study_pro;
	}
	public void setStudy_pro(String study_pro) {
		this.study_pro = study_pro;
	}
	public String getStudy_back() {
		return study_back;
	}
	public void setStudy_back(String study_back) {
		this.study_back = study_back;
	}
	public String getStudy_intro() {
		return study_intro;
	}
	public void setStudy_intro(String study_intro) {
		this.study_intro = study_intro;
	}
	public int getProSize() {
		return proSize;
	}
	public void setProSize(int proSize) {
		this.proSize = proSize;
	}
	public int getBackSize() {
		return backSize;
	}
	public void setBackSize(int backSize) {
		this.backSize = backSize;
	}
	
}
