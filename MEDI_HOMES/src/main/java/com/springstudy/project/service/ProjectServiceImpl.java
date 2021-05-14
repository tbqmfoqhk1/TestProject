package com.springstudy.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springstudy.project.dao.ProjectDao;
import com.springstudy.project.domain.Disease;
import com.springstudy.project.domain.HealthInfo;
import com.springstudy.project.domain.Project;
import com.springstudy.project.domain.instruments;

@Service
public class ProjectServiceImpl implements ProjectService {
	
	private static final int PAGE_SIZE = 10;
	
	private static final int PAGE_GROUP = 10;
	
	@Autowired
	private ProjectDao projectDao;	
	
	public void setProjectDao(ProjectDao projectDao) {
		this.projectDao = projectDao;
	}
	
	@Override
	public Map<String, Object> projectList(int pageNum, String keyword, String rate) {
		
		int currentPage = pageNum;  //1
		int startRow =  (currentPage - 1) * PAGE_SIZE ; // 1, 11, 21 , 31, 40
		int listCount = 0;
		System.out.println("currentPage :" + currentPage);
		listCount = projectDao.getProjectCount(keyword, rate);
		
		
		List<Project> pList = projectDao.projectList(startRow, PAGE_SIZE, keyword, rate);
		
		
		int pageCount = 
				listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
		
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
					- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
		System.out.println("startRow :" + startRow);
		int endPage = startPage + PAGE_GROUP - 1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
			modelMap.put("pList", pList);
			modelMap.put("pageCount", pageCount);
			modelMap.put("startPage", startPage);
			modelMap.put("endPage", endPage);
			modelMap.put("currentPage", currentPage);
			modelMap.put("listCount", listCount);
			modelMap.put("pageGroup", PAGE_GROUP);
			modelMap.put("rate", rate);
			
		return modelMap;
	}
	
	@Override
	public Map<String, Object> instrumentsList(int pageNum, String keyword) {
		
		int currentPage = pageNum;  //1
		int startRow =  (currentPage - 1) * PAGE_SIZE ; // 1, 11, 21 , 31, 40
		int listCount = 0;
		System.out.println("currentPage :" + currentPage);
		listCount = projectDao.getInstrumentsCount(keyword);
		
		List<instruments> iList = projectDao.instrumentsList(startRow, PAGE_SIZE, keyword);
		
		
		int pageCount = 
				listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
		
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
					- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
		System.out.println("startRow :" + startRow);
		int endPage = startPage + PAGE_GROUP - 1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		Map<String, Object> modelMap1 = new HashMap<String, Object>();
		
			modelMap1.put("iList", iList);
			modelMap1.put("pageCount", pageCount);
			modelMap1.put("startPage", startPage);
			modelMap1.put("endPage", endPage);
			modelMap1.put("currentPage", currentPage);
			modelMap1.put("listCount", listCount);
			modelMap1.put("pageGroup", PAGE_GROUP);
			
		return modelMap1;
	}

	@Override
	public Map<String, Object> projectHealthInfoList(int pageNum) {
		
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * PAGE_SIZE;
		int listCount = projectDao.getHealthInfoCount();
		System.out.println("startRow :" + currentPage);
		List<HealthInfo> projectHealthInfoList = projectDao.projectHealthInfoList(startRow, PAGE_SIZE);
		
		int pageCount = 
				listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
		
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
				- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
		
		int endPage = startPage + PAGE_GROUP - 1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		Map<String, Object> modelMap1 = new HashMap<String, Object>();
		
		modelMap1.put("projectHealthInfoList", projectHealthInfoList);
		modelMap1.put("pageCount", pageCount);
		modelMap1.put("startPage", startPage);
		modelMap1.put("endPage", endPage);
		modelMap1.put("currentPage", currentPage);
		modelMap1.put("listCount", listCount);
		modelMap1.put("pageGroup", PAGE_GROUP);
		
		return modelMap1;
	}
	
	@Override
	public Map<String, Object> projectDiseaseList(int pageNum, String keyword) {
		
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * PAGE_SIZE;
		int listCount = projectDao.getDiseaseCount(keyword);
		
		List<Disease> projectDiseaseList = projectDao.projectDiseaseList(startRow, PAGE_SIZE, keyword);
		
		int pageCount = 
				listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
		
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
				- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
		
		int endPage = startPage + PAGE_GROUP - 1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		Map<String, Object> modelMap2 = new HashMap<String, Object>();
		
		modelMap2.put("projectDiseaseList", projectDiseaseList);
		modelMap2.put("pageCount", pageCount);
		modelMap2.put("startPage", startPage);
		modelMap2.put("endPage", endPage);
		modelMap2.put("currentPage", currentPage);
		modelMap2.put("listCount", listCount);
		modelMap2.put("pageGroup", PAGE_GROUP);
		modelMap2.put("keyword", keyword);
		
		return modelMap2;
		
	}

}