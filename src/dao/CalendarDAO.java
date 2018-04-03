package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dao.MybatisConnector;
import model.CalendarVO;

public class CalendarDAO extends MybatisConnector{
	private final String namespace = "cal.mybatis";
	private static CalendarDAO instance = new CalendarDAO();
	private CalendarDAO() {}
	
	public static CalendarDAO getInstance() {
		return instance;
	}
	
	SqlSession sqlSession;
	
	
	public List getCalendarList(int studynum) {
		
		sqlSession=sqlSession();
		Map map=new HashMap();
		map.put("studynum", studynum);
		
		List li=null;
		li=sqlSession.selectList(namespace+".getCalendarList",map);
		sqlSession.close();
		
		return li;
		
	}
	
	public int updateCalendar(CalendarVO calendar) {
		sqlSession=sqlSession();
		int ck=-1;
		ck=sqlSession.update(namespace+".updateCalendar",calendar);
		sqlSession.commit();
		sqlSession.close();
		return ck;

	}
	
	public int deleteCalendar(String num) {
		sqlSession=sqlSession();
		Map map=new HashMap();
		map.put("num", num);
		int ck=-1;
		ck=sqlSession.update(namespace+".deleteCalendar",map);
		sqlSession.commit();
		sqlSession.close();
		return ck;

	}
	
	
	public void addCalendar(CalendarVO calendar) {
		sqlSession=sqlSession();
		int num=0;
		num=sqlSession.selectOne(namespace+".getNextNumber");
		calendar.setNum(num);
		sqlSession.insert(namespace+".addCalendar",calendar);
		sqlSession.commit();
		sqlSession.close();
		
	}
	
	public CalendarVO getCalendar(String num) {
		sqlSession=sqlSession();
		
		Map map=new HashMap();
		map.put("num", num);
		
		CalendarVO calendar=sqlSession.selectOne(namespace+".getCalendar",map);
		
		sqlSession.close();
		return calendar;
		
		
	}
	
	
}
