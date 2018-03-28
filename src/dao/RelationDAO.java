package dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dao.MybatisConnector;

public class RelationDAO extends MybatisConnector{
	private static RelationDAO instance = new RelationDAO();
	private RelationDAO() {
	}
	public static RelationDAO getInstance() {
		return instance;
	}
	
	private final String namespace="relation";
	SqlSession sqlSession;
	
	public void requestJoin(String memberid, String studyName, String nickname,
			String position, String leader) {
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<>();
		map.put("memberid", memberid);
		map.put("studyName", studyName);
		map.put("nickname", nickname);
		map.put("position", position);
		map.put("leader", leader);
		sqlSession.insert(namespace+".requestJoin",map);
		sqlSession.commit();
		sqlSession.close();
	}
	public void cancelJoin(String memberId, String studyName) {
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("studyName", studyName);
		sqlSession.delete(namespace+".cancelJoin",map);
		sqlSession.commit();
		sqlSession.close();
	}
}
