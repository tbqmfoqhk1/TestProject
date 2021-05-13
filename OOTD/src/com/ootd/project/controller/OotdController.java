package com.ootd.project.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ootd.project.service.BoardDetailService;
import com.ootd.project.service.BoardListService;
import com.ootd.project.service.BoardWriteService;
import com.ootd.project.service.BookmarkService;
import com.ootd.project.service.CommandProcess;
import com.ootd.project.service.DeleteFormService;
import com.ootd.project.service.DeleteService;
import com.ootd.project.service.ForwardService;
import com.ootd.project.service.JoinFormService;
import com.ootd.project.service.JoinResultService;
import com.ootd.project.service.LoginFormService;
import com.ootd.project.service.LoginService;
import com.ootd.project.service.LogoutService;
import com.ootd.project.service.MyPageService;
import com.ootd.project.service.OverlapIdCheckService;
import com.ootd.project.service.PassCheckService;
import com.ootd.project.service.PassSearchCheckService;
import com.ootd.project.service.PassSearchUpdateService;
import com.ootd.project.service.RegisterDeleteService;
import com.ootd.project.service.RegisterUpdateFormService;
import com.ootd.project.service.RegisterUpdateResultService;
import com.ootd.project.service.WeatherPageService;
import com.ootd.project.service.WriteFormService;
import com.ootd.project.service.updateFormService;
import com.ootd.project.service.updateService;

//게시판 및 회원관련 요청을 처리하는 프런트 컨트롤러
public class OotdController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* 서블릿 초기화 메서드
	 * 이 서블릿 클래스의 인스턴스가 생성되고 아래 초기화 메서드가 딱 한 번 호출 된다.
	 **/
	public void init() throws ServletException {

		ServletContext sc = getServletContext();
		String uploadDir = sc.getInitParameter("uploadDir");
		String realPath = sc.getRealPath(uploadDir);
		File parentFile = new File(realPath);
		

		if(! (parentFile.exists() && parentFile.isDirectory())) {
			parentFile.mkdir();
		}
		
		sc.setAttribute("uploadDir", uploadDir);
		sc.setAttribute("parentFile", parentFile);
		System.out.println("init - " + parentFile);
	}

	public void doProcess(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {		
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		System.out.println("uri : " + requestURI + ", ctxPath : " + contextPath);
		String command = requestURI.substring(contextPath.length());
		System.out.println("command : " + command);
		ForwardService forward = null;
		CommandProcess service = null;
		
		/* 요청 URI에서 추출한 명령을 비교해 요청을 처리할 모델 클래스를
		 * 결정하여 객체를 생성하고 메서드를 호출해 요청을 처리한다.
		 **/
		if(command.equals("/boardList.mvc") 
				|| command.equals("/*.mvc")
				|| command.equals("/index.mvc")) {
				
			service = new BoardListService();  
			forward = service.requestProcess(request, response);
			
		} else if(command.equals("/boardDetail.mvc")) {
			
			 service = new BoardDetailService(); 
			forward = service.requestProcess(request, response);
		
		} else if (command.equals("/updateForm.mvc")) {
			
			service = new updateFormService();
			forward = service.requestProcess(request, response);
		
		} else if(command.equals("/updateProcess.mvc")) {
			
			/* 게시 글 수정 폼에서 수정하기 버튼이 클릭된 경우의 처리 
			 * 게시 글 수정 요청을 처리하는 UpdateService 클래스의
			 * 인스턴스를 생성한 후 Request와 Response 객체를 매개변수로
			 * requestProcess()를 호출하여 게시 글을 DB에서 수정한다.
			 */	
			service = new updateService();
			forward = service.requestProcess(request, response);
			
		}  else if (command.equals("/writeForm.mvc")) {
			
			service = new WriteFormService(); 
			forward = service.requestProcess(request, response); 
		} else if(command.equals("/writeProcess.mvc")) {
			
			service = new BoardWriteService(); 
			forward = service.requestProcess(request, response);
			
		} else if(command.equals("/deleteProcess.mvc")) {
			
			service = new DeleteService();
			forward = service.requestProcess(request, response);
		} else if(command.equals("/loginForm.mvc")) {
			
			service = new LoginFormService();
			forward = service.requestProcess(request, response);
			
		}else if(command.equals("/joinForm.mvc")) {
			
			service = new JoinFormService();
			forward = service.requestProcess(request, response);
		
		} else if(command.equals("/login.mvc")) {
			
			service = new LoginService();
			forward = service.requestProcess(request, response);
		
		} else if(command.equals("/logout.mvc")) {
			
			service = new LogoutService();
			forward = service.requestProcess(request, response);
			
		}	else if(command.equals("/passCheck.mvc")) {
			// 비밀번호 찾기 창 띄우는 서비스
			service = new PassCheckService();
			forward = service.requestProcess(request, response);
			
		}	 else if(command.equals("/passSearchCheck.mvc")) {
			// 비밀번호 찾기에서 아이디와 전화번호 일치하는지 여부 확인
			service = new PassSearchCheckService();
			forward = service.requestProcess(request, response);
			
		} else if(command.equals("/passSearchUpdate.mvc")) {
			// 비밀번호 찾기에서 비밀번호 변경
			service = new PassSearchUpdateService();
			forward = service.requestProcess(request, response);
		
		}	else if(command.equals("/overlapIdCheck.mvc")) {
			service = new OverlapIdCheckService();
			forward = service.requestProcess(request, response);
			
		} else if(command.equals("/joinResult.mvc")) {
			service = new JoinResultService();
			forward = service.requestProcess(request, response);
			
		}  else if(command.equals("/registerUpdateForm.mvc")) {
			
			/* 로그아웃이 클릭된 경우의 처리
			 * 회원 로그아웃 요청을 처리하는 MemberUpdateFormService 클래스의
			 * 인스턴스를 생성한 후 Request와 Response 객체를 매개변수로
			 * requestProcess()를 호출하여 회원 로그아웃 요청을 처리한다.
			 */
			service = new RegisterUpdateFormService();
			forward = service.requestProcess(request, response);
			
		} else if(command.equals("/registerUpdateResult.mvc")) {
			
			/* 로그아웃이 클릭된 경우의 처리
			 * 회원 로그아웃 요청을 처리하는 MemberUpdateResultService 클래스의
			 * 인스턴스를 생성한 후 Request와 Response 객체를 매개변수로
			 * requestProcess()를 호출하여 회원 로그아웃 요청을 처리한다.
			 */
			service = new RegisterUpdateResultService();
			forward = service.requestProcess(request, response);
			
		}  else if(command.equals("/delete.mvc")) {
			
			service = new RegisterDeleteService();
			forward = service.requestProcess(request, response);
		
		} else if(command.equals("/deleteForm.mvc")) {
			
			/* 로그아웃이 클릭된 경우의 처리
			 * 회원 로그아웃 요청을 처리하는 MemberUpdateFormService 클래스의
			 * 인스턴스를 생성한 후 Request와 Response 객체를 매개변수로
			 * requestProcess()를 호출하여 회원 로그아웃 요청을 처리한다.
			 */
			service = new DeleteFormService();
			forward = service.requestProcess(request, response);
			
		} else if(command.equals("/myPage.mvc")) {
			
			service = new MyPageService();
			forward = service.requestProcess(request, response);
		
		} else if(command.equals("/weatherPage.mvc")) {
			
			/* 로그아웃이 클릭된 경우의 처리
			 * 회원 로그아웃 요청을 처리하는 MemberUpdateResultService 클래스의
			 * 인스턴스를 생성한 후 Request와 Response 객체를 매개변수로
			 * requestProcess()를 호출하여 회원 로그아웃 요청을 처리한다.
			 */
			service = new WeatherPageService();
			forward = service.requestProcess(request, response);
			
		} else if(command.equals("/bookmark.mvc")) {
			
			service = new BookmarkService();
			forward = service.requestProcess(request, response);
		
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher rd = 
						request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}	
	}

	protected void doGet(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doProcess(request, response);
	}
}
