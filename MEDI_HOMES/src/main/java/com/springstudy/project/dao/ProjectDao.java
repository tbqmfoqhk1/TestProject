package com.springstudy.project.dao;

import java.util.List;

import com.springstudy.project.domain.Disease;
import com.springstudy.project.domain.HealthInfo;
import com.springstudy.project.domain.Project;
import com.springstudy.project.domain.instruments;

public interface ProjectDao {
	
	public abstract List<Project> projectList(
			int startRow, int num, String keyword, String rate);

	public abstract List<instruments> instrumentsList(
			int startRow, int num, String keyword);
	
	public abstract int getProjectCount(String keyword, String rate);
	
	public abstract int getInstrumentsCount(String keyword);
	
	public abstract List<HealthInfo> projectHealthInfoList(int startRow, int num);
	
	public abstract int getHealthInfoCount();
	
	public abstract List<Disease> projectDiseaseList(int startRow, int num, String keyword);
	
	public abstract int getDiseaseCount(String keyword);
}
