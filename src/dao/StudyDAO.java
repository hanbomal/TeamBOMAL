package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dao.MybatisConnector;
import model.RelationVO;
import model.StudyVO;

public class StudyDAO extends MybatisConnector{
	private static StudyDAO instance = new StudyDAO();
	private StudyDAO() {
	}
	public static StudyDAO getInstance() {
		return instance;
	}
    private final String namespace="study";
    SqlSession sqlSession;
    
	public void makingStudy(StudyVO room) {
		sqlSession=sqlSession();
		int num=sqlSession.selectOne(namespace+".getNextNum");
		room.setNum(num);
		sqlSession.insert(namespace+".makingStudy",room);
		sqlSession.commit();
		sqlSession.close();
	}
	public List resultList(String studyName, String memberid) {
		sqlSession=sqlSession();
		Map<String,String> map = new HashMap<>();
		map.put("studyName", studyName);
		List li=sqlSession.selectList(namespace+".resultList",map);
		List groupli=null;
		Iterator it = li.iterator(); 
		
		if(it.hasNext()) {
			groupli=new ArrayList<>();
			do {
				StudyVO groupInfo = (StudyVO) it.next();
				StudyDAO studyDB = StudyDAO.getInstance();
				RelationVO info=studyDB.getRelation(groupInfo.getStudyName(), memberid);
				groupInfo.setRelation(info);
				groupli.add(groupInfo);				
			}while(it.hasNext());
		}
		sqlSession.close();
		return groupli;
	}
	public RelationVO getRelation(String studyName,String memberid ) {
		sqlSession=sqlSession();
		Map<String,String> map = new HashMap<>();
		map.put("studyName", studyName);
		map.put("memberid", memberid);
		RelationVO status=sqlSession.selectOne(namespace+".getRelation",map);
		sqlSession.close();
		return status;
	}
	
	public List getAllStudy() {
		sqlSession=sqlSession();
		List li=sqlSession.selectList(namespace+".getAllStudy");
		sqlSession.close();
		return li;
	}
}
