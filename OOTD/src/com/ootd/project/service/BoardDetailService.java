package com.ootd.project.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ootd.project.dao.BoardDao;
import com.ootd.project.vo.Board;
import com.ootd.project.vo.Reply;

// 게시 글 상세보기 요청을 처리하는 서비스 클래스
public class BoardDetailService implements CommandProcess {
	
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		
		/* request 객체로 부터 HttpSession 객체를 구한다.
		 * HttpSession 객체를 구하면 사용자가 접속한 현재 세션 정보에 접근할 수 있다.
		 * 게시 글 리스트 요청을 처리하는 BoardListService 클래스를 제외하고 모든
		 * 모델 클래스에 아래와 같이 코드를 추가하면 된다.
		 **/
		HttpSession session = request.getSession();
		
		/* 세션 영역에 isLogin이 존재하지 않으면 NullPointerException이
		 * 발생하기 때문에 먼저 null인지를 체크하고 형 변환 했다.
		 **/
		boolean isLogin = session.getAttribute("isLogin") != null ? 
				(Boolean) session.getAttribute("isLogin") : false;
		
		// 로그인 상태가 아니면 알림 창을 띄우고 이전으로 돌려보낸다.
		
		
		//요청 파라미터로 넘어 온 게시 글 번호와 페이지 번호를 읽어온다.
		String id = (String)session.getAttribute("m_id");
		String no = request.getParameter("no");
		String pageNum = request.getParameter("pageNum");	
		String keyword = request.getParameter("keyword");	
		int favchk=0;
		int favnum=0;
		int bbmk=0;
		// no와 pageNum이 비어 있으면 비정상 요청임
		
		/* 요청 파라미터에서 type이나 keyword가 비어 있으면 일반 
		 * 게시 글 리스트에서 넘어온 요청으로 간주하여 false 값을 갖게 한다.
		 * 이 정보는 게시 글 리스트와 검색 리스트로 구분해 돌려 보내기 위해 필요하다.
		 **/
		boolean searchOption = (
				keyword == null || keyword.equals("")) ? false : true; 		
		
		/* BoardDao 객체를 생성하고 요청한 게시 글 하나를 가져온다.
		 * 게시 글 읽기 요청이므로 두 번째 인수를 true로 지정해 DAO에서
		 * 게시 글 읽은 횟수를 1 증가 시키게 된다. 
		 **/
		BoardDao dao = new BoardDao();
		
		Board board = dao.getBoard(Integer.valueOf(no));
		favnum = dao.getFavor(Integer.valueOf(no));
		
		ArrayList<Reply> replyList = dao.getReplyList(Integer.valueOf(no));

		/* 파일 명에 한글이 포함되어 있으면 다운로드시 에러가 발생하기 때문에
		 * UTF-8로 인코딩 해 준다. IE에서 링크로 요청 시 파라미터에 한글이 
		 * 포함되면 IE는 URLEncoding을 하지 않고 서버로 전송하는데 톰캣 
		 * 7.06x 버전에서 정상적으로 동작하던 것이 7.07x 버전에서는 Invalid
		 * character found in the request target 이라는 에러가
		 * 발생한다. 이 문제는 아래와 같이 java.net 패키지의 URLEncoder
		 * 클래스를 이용해 수동으로 URLEncoding을 해주면 해결할 수 있다.
		 * 크롬 브라우저는 링크로 요청 시 파라미터에 한글이 포함되어 있으면 브라우저 
		 * 주소창에는 한글 그대로 표시되지만 UTF-8로 URLEncoding을 해준다.
		 **/
		if(isLogin) {
			
			favchk = dao.boardFavorchk(id,Integer.valueOf(no));
			bbmk=dao.boardBookmark(id,Integer.valueOf(no));
		}
		
		System.out.println("bbmk:"+bbmk);
		request.setAttribute("board", board);
		request.setAttribute("replyList", replyList);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("searchOption", searchOption);
		request.setAttribute("favchk", favchk);
		request.setAttribute("favnum", favnum);
		request.setAttribute("bbmk", bbmk);
		// 검색 요청이면 type과 keyword를 request 영역에 저장한다.
		if(searchOption) {
			request.setAttribute("word", keyword);
			try {
				/* IE에서 링크로 요청 시 파라미터에 한글이 포함되면 IE는
				 * URLEncoding을 하지 않고 서버로 전송하는데 톰캣 7.06x
				 * 버전에서 정상적으로 동작하던 것이 7.07x 버전에서는 Invalid
				 * character found in the request target 이라는 에러가
				 * 발생한다. 이 문제는 아래와 같이 java.net 패키지의 URLEncoder
				 * 클래스를 이용해 수동으로 URLEncoding을 해주면 해결할 수 있다.
				 * 크롬 브라우저는 링크로 요청 시 파라미터에 한글이 포함되어 있으면 브라우저 
				 * 주소창에는 한글 그대로 표시되지만 UTF-8로 URLEncoding을 해준다.
				 **/				
				keyword = URLEncoder.encode(keyword, "utf-8");
			} catch (UnsupportedEncodingException e) {				
				e.printStackTrace();
			}			
			request.setAttribute("keyword", keyword);
		}
		
		/* Redirect 정보와 View 페이지 경로 정보를 저장하는 ForwardService 클래스의
		 * 인스턴스를 생성하고 Redirect 여부를 false로 설정하여 Forward 액션을 지정
		 * 한 후 View 페이지로 게시 글 리스트를 출력하는 JSP 페이지의 경로를 지정한다.
		 * 
		 * 게시 글 상세보기 요청에 대한 결과(모델)를 request 영역의 속성에 저장하고
		 * ForwardService 클래스를 사용해 요청에 대한 결과(모델)를 출력할
		 * View 페이지와 View 페이지를 호출하는 방식을 지정하여 컨트롤러로 넘긴다.
		 * 
		 * 포워딩을 해야 할 경우 아래와 같이 웹 템플릿인 index.jsp로 뷰 페이지를
		 * 지정하고 body라는 파라미터에 웹 템플릿에 동적으로 포함시킬 페이지를
		 * 지정하면 된다. 포워딩 할 경우 웹 템플릿 페이지인 index.jsp 페이지에서
		 * body라는 파라미터 값을 읽어서 동적으로 포함되는 컨텐츠 페이지를 include
		 * 하므로 index.jsp를 기준으로 상대 참조 방식으로 컨텐츠 페이지를 지정하면 된다.
		 **/
		ForwardService forward = new ForwardService();	
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=board/boardDetail.jsp");
		return forward;
	}
}
