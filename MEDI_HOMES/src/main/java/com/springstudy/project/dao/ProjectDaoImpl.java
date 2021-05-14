package com.springstudy.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springstudy.project.domain.Disease;
import com.springstudy.project.domain.HealthInfo;
import com.springstudy.project.domain.Project;
import com.springstudy.project.domain.instruments;

@Repository
public class ProjectDaoImpl implements ProjectDao {
	
	private SqlSessionTemplate sqlSession;
	
	private final String NAME_SPACE = "com.springstudy.project.mapper.ProjectMapper";
		
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<Project> projectList(
			int startRow, int num, String keyword, String rate) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startRow", startRow);
		params.put("num", num);
		params.put("keyword", keyword);
		params.put("rate", rate);
		System.out.println(keyword);
		return sqlSession.selectList(NAME_SPACE + ".projectList", params);
	}
	
	@Override
	public List<instruments> instrumentsList(int startRow, int num, String keyword) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startRow", startRow);
		params.put("num", num);
		params.put("keyword", keyword);
		
		return sqlSession.selectList(NAME_SPACE + ".instrumentsList", params);
	}
	
	@Override
	public int getProjectCount(String keyword, String rate) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("keyword", keyword);
		params.put("rate", rate);
		
		return sqlSession.selectOne(NAME_SPACE + ".getProjectCount", params);
	}
	
	@Override
	public int getInstrumentsCount(String keyword) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("keyword", keyword);
		
		return sqlSession.selectOne(NAME_SPACE + ".getInstrumentsCount", params);
	}

	
	@Override
	public List<HealthInfo> projectHealthInfoList(int startRow, int num) {
		
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("startRow", startRow);
		params.put("num", num);
		
		return sqlSession.selectList(NAME_SPACE + ".projectHealthInfoList", params);
	}
	
	@Override
	public int getHealthInfoCount() {
	
		return sqlSession.selectOne(NAME_SPACE + ".getHealthInfoCount");
	}
	
	@Override
	public List<Disease> projectDiseaseList(int startRow, int num, String keyword) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startRow", startRow);
		params.put("num", num);
		params.put("keyword", keyword);
		System.out.println("keyword : " + keyword);
		return sqlSession.selectList(NAME_SPACE + ".projectDiseaseList", params);
	}
	
	@Override
	public int getDiseaseCount(String keyword) {
	
		return sqlSession.selectOne(NAME_SPACE + ".getDiseaseCount", keyword);
	}
}
