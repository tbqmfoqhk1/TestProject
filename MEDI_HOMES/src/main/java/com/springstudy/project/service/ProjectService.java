package com.springstudy.project.service;

import java.util.List;
import java.util.Map;

import com.springstudy.project.domain.Disease;
import com.springstudy.project.domain.HealthInfo;
import com.springstudy.project.domain.Project;

public interface ProjectService {
	
	public abstract Map<String, Object> projectList(
			int pageNum, String keyword, String rate);
	
	public abstract Map<String, Object> instrumentsList(
			int pageNum, String keyword);

	public abstract Map<String, Object> projectHealthInfoList(int pageNum);
	
	public abstract Map<String, Object> projectDiseaseList(int pageNum, String keyword);

}
