package com.ootd.project.service;

import java.io.IOException;
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

public class BoardWriteService implements CommandProcess {

	public ForwardService requestProcess
			(HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {

		String uploadDir = (String) request.getServletContext().getAttribute("uploadDir");
		String realPath = request.getServletContext().getRealPath(uploadDir);
		// 업로드 파일의 최대 크기를 100MB로 지정
		int maxFileSize = 100 * 1024 * 1024;
		// 파일의 인코딩 타입을 UTF-8로 지정
		String encoding = "UTF-8"; 
		
		MultipartRequest multi = new MultipartRequest(request, realPath, 
				maxFileSize, encoding, new DefaultFileRenamePolicy());
			
			HttpSession session = request.getSession();
	        String m_id = (String)session.getAttribute("m_id");
			String m_age =String.valueOf(session.getAttribute("m_age"));
			String list_reg_date = multi.getParameter("write_date");
			String list_weather = multi.getParameter("write_weather");
			String list_temp = multi.getParameter("write_temp");
			String list_content = multi.getParameter("write_clothes");
			
			String check1 = multi.getParameter("write_chk_1");
		    String check2 = multi.getParameter("write_chk_2");
		    String check3 = multi.getParameter("write_chk_3");
		    String check4 = multi.getParameter("write_chk_4");
		    String check5 = multi.getParameter("write_chk_5");
		    String check6 = multi.getParameter("write_chk_6");
		    String check7 = multi.getParameter("write_chk_7");
		    String check8 = multi.getParameter("write_chk_8");
		    String check9 = multi.getParameter("write_chk_9");
		    String check10 = multi.getParameter("write_chk_10");
			
		    ArrayList<String> hash_array = new ArrayList<>();
		    String hash_list ="";
					
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
					hash_list+=hash_array.get(i);
					if(i != hash_array.size()-1){
						hash_list+=" ";
					}
				}
			}
			
		Timestamp releasedate = Timestamp.valueOf(
				"20"+list_reg_date.substring(0, 2) + "-" + list_reg_date.substring(2, 4) +  "-" +  list_reg_date.substring(4, 6)
		         + " 00:00:00");
		
		String fileName = multi.getFilesystemName("write_img");
		System.out.println("업로드 된 파일명 : " + fileName);
		System.out.println("원본 파일명 : " + multi.getOriginalFileName("write_img"));

		Board board = new Board();
		board.setM_id(m_id);
		board.setM_age(Integer.parseInt(m_age));
		board.setList_reg_date(releasedate);
		board.setList_weather(list_weather);
		board.setList_temp(list_temp);
		board.setList_img(fileName);
		board.setList_content(list_content);
		board.setList_hash(hash_list);
		
		System.out.println("board" + board);
		/* 사용자가 업로드한 파일 데이터 처리
		* MultipartRequest 객체를 통해 파일 이름을 구하여 변수에 저장한다. * 파일이 업로드 되지 않으면 fileName은 null 값을 받는다. **/
		if(board.getList_img() == null) {
			System.out.println("파일이 업로드 되지 않았음");
			}
		/* BoardDao 객체를 얻어 게시 글을 DB에 추가하기
		* DB에 게시 글을 추가하고 브라우저에게 게시 글 리스트를 요청하라고 응답
		* 게시 글쓰기가 완료된 후 Redirect 시키지 않으면 이 페이지를 새로 고침 하여
		* 재요청 할 때 마다 이미 추가된 게시 글을 계속하여 추가하는 문제가 발생 한다. **/
		BoardDao dao = new BoardDao();
		dao.insertBoard(board);
	
		ForwardService forward = new ForwardService();
		forward.setRedirect(true);
		forward.setPath("boardList.mvc");
		return forward;
		}
		}
	
