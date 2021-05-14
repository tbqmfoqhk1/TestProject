package com.springstudy.project.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springstudy.project.domain.Disease;
import com.springstudy.project.domain.HealthInfo;
import com.springstudy.project.domain.Project;
import com.springstudy.project.service.ProjectService;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	
	public void setProjectService(ProjectService service) {
		this.service = service;
	}
	
	@RequestMapping(value={"/projectMain"}, method=RequestMethod.GET)
	public String projectMain() {	
		
		return "projectMain";
	}
	
	@RequestMapping(value= {"/projectList", "/list"}, method=RequestMethod.GET)
	public String projectList(Model model) {
		
		return "projectList";
	}

	@RequestMapping(value={"/projectSelf_Test"}, method=RequestMethod.GET)
	public String projectSelfTest() {	
		
		return "projectSelf_Test";
	}
	
	@RequestMapping(value= {"/projectMap"}, method=RequestMethod.GET)
	public String projectList(Model model,
				@RequestParam(value="pageNum", required=false, 
				defaultValue="1") int pageNum,
				@RequestParam(value="keyword", required=false,
				defaultValue="null") String keyword,
				@RequestParam(value="rate", required=false,
				defaultValue="null") String rate) {
				
				Map<String, Object> modelMap = 
						service.projectList(pageNum, keyword, rate);
		
				model.addAllAttributes(modelMap);
				model.addAttribute("keyword", keyword);
				model.addAttribute("rate", rate);
				System.out.println("modelmap : " + modelMap );
			return "projectMap";
	}
	
	@RequestMapping(value= {"/projectMap02"}, method=RequestMethod.GET)
	public String instrumentsList(Model model, 
			@RequestParam(value="pageNum", required=false, 
			defaultValue="1") int pageNum,
			@RequestParam(value="keyword", required=false,
			defaultValue="null") String keyword) {
		
			Map<String, Object> modelMap1 = 
				service.instrumentsList(pageNum, keyword);

		model.addAllAttributes(modelMap1);
		model.addAttribute("keyword", keyword);
		return "projectMap02";
	}
	
	@RequestMapping(value= {"/projectHealth_Info"}, method=RequestMethod.GET)
	public String projectHealth_Info(Model model,
			@RequestParam(value="pageNum", required=false,
			defaultValue="1") int pageNum) {
		
		Map<String, Object> modelMap1 = service.projectHealthInfoList(pageNum);
		
		model.addAllAttributes(modelMap1);

		return "projectHealth_Info";
	}
	
	@RequestMapping(value= {"/projectDisease"}, method=RequestMethod.GET)
	public String projectDisease(Model model,
			@RequestParam(value="pageNum", required=false,
			defaultValue="1") int pageNum,
			@RequestParam(value="keyword", required=false,
			defaultValue="null") String keyword) {
		
		Map<String, Object> modelMap2 = service.projectDiseaseList(pageNum, keyword);
		
		model.addAllAttributes(modelMap2);

		return "projectDisease";
	}
}
