package com.ootd.project.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ootd.project.dao.BoardDao;
import com.ootd.project.vo.Board;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

// 게시 글 상세보기 요청을 처리하는 서비스 클래스
public class updateService implements CommandProcess {
	
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		
		BoardDao dao = new BoardDao();
		Board board = null;
		String  weather = null, temp = null, reg_date = null, content = null, img = null,
				sNo = null, pageNum = null, keyword=null, hash=null;
		int list_no = 0;	
		

			
			String uploadDir = 
					(String) request.getServletContext().getAttribute("uploadDir");
			String realPath = request.getServletContext().getRealPath(uploadDir);
			
			// 업로드 파일의 최대 크기를 100MB로 지정
			int maxFileSize = 100 * 1024 * 1024;
			
			// 파일의 인코딩 타입을 UTF-8로 지정
			String encoding = "UTF-8"; 
			
			MultipartRequest multi = new MultipartRequest(request, realPath, 
					maxFileSize, encoding, new DefaultFileRenamePolicy());	
			
			HttpSession session = request.getSession();
			sNo = multi.getParameter("no");		
			pageNum = multi.getParameter("pageNum");
			keyword = multi.getParameter("keyword");	
			
			
			
			if(sNo == null || sNo.equals("") || pageNum == null || pageNum.equals("")) {

					/* 스트림에 직접 쓰기위해 응답 객체로 부터 스트림을 구한다.
					 * 응답 객체의 스트림을 구하기 전해 ContentType이 설정되야 한다. 
					 * 그렇지 않으면 한글과 같은 데이터는 깨져서 출력된다.
					 **/			
					response.setContentType("text/html; charset=utf-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("	alert('정상적인 접근이 아닙니다.');");
					out.println("	history.back();");
					out.println("</script>");
					return null;
				}
			
			
			
			weather = multi.getParameter("update_weather");
			temp = multi.getParameter("update_temp");
			reg_date = multi.getParameter("update_date");	
			content = multi.getParameter("update_content");
			String check1 = multi.getParameter("update_chk_1");
		    String check2 = multi.getParameter("update_chk_2");
		    String check3 = multi.getParameter("update_chk_3");
		    String check4 = multi.getParameter("update_chk_4");
		    String check5 = multi.getParameter("update_chk_5");
		    String check6 = multi.getParameter("update_chk_6");
		    String check7 = multi.getParameter("update_chk_7");
		    String check8 = multi.getParameter("update_chk_8");
		    String check9 = multi.getParameter("update_chk_9");
		    String check10 = multi.getParameter("update_chk_10");
			
		    ArrayList<String> hash_array = new ArrayList<>();
		    String hash1 ="";
					
			if(check1!=null){
				hash_array.add(check1);
			}
			if(check2!=null){
				hash_array.add(check2);
			}
			if(check3!=null){
				hash_array.add(check3);
			}
			if(check4!=null){
				hash_array.add(check4);
			}
			if(check5!=null){
				hash_array.add(check5);
			}
			if(check6!=null){
				hash_array.add(check6);
			}
			if(check7!=null){
				hash_array.add(check7);
			}
			if(check8!=null){
				hash_array.add(check8);
			}
			if(check9!=null){
				hash_array.add(check9);
			}
			if(check10!=null){
				hash_array.add(check10);
			}
			if(hash_array.size()>=1){
				for(int i = 0; i < hash_array.size();i++){
					hash1+=hash_array.get(i);
					if(i != hash_array.size()-1){
						hash1+=" ";
					}
				}
			}
			
		
			Timestamp releasedate = Timestamp.valueOf(
					"20"+reg_date.substring(0, 2) + "-" + reg_date.substring(2, 4) +  "-"  + reg_date.substring(4, 6)
			         + " 00:00:00");
			
			 img = multi.getFilesystemName("update_img");
			 System.out.println("업로드 된 파일명 : " + img);
				System.out.println("원본 파일명 : " + multi.getOriginalFileName("update_img"));
			 
			board = new Board();
			board.setList_no(Integer.parseInt(sNo));
			board.setList_weather(weather);
			board.setList_temp(temp);
			board.setList_reg_date(releasedate);
			board.setList_img(img != null ? img : null);
			board.setList_content(content);	
			board.setList_hash(hash1);
			
			
			
			// 파일명이 존재하면 파일명을 지정하고 존재하지 않으면 null로 지정 한다.
			
			if(board.getList_img() == null) {		
				System.out.println("파일이 업로드 되지 않았음");		
			}
			
		
				dao= new BoardDao();
				dao.updateBoard(board);
				
				boolean searchOption = (
						 keyword == null || keyword.equals("")) ? false : true; 	
				
				
				String url = "boardDetail.mvc?no="+ sNo + "&pageNum=" + pageNum;
				
				if(searchOption) {
					
					/* 리다이렉트 할 때 파라미터에 한글이 포함되어 있으면 한글로된 파라미터 값은
					 * 공백문자로 변경되어 리다이렉트 되기 때문에 java.net 패키지의 URLEncoder
					 * 클래스를 이용해 수동으로 인코딩을 해줘야 한다.
					 *
					 * 아래는 검색 요청일 경우만 type과 keyword 파라미터를 적용시킨다.
					 **/	
					keyword = URLEncoder.encode(keyword, "utf-8");
					
					url +="&keyword=" + keyword; 
				}		
		
		ForwardService forward = new ForwardService();	
		forward.setRedirect(true);
		forward.setPath(url);
		return forward;
	}
}
