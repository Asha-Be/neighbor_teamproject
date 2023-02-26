package com.good.neighbor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.Console;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
//자동 setter작업

import org.apache.ibatis.session.SqlSession; //mybatis 사용

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;

import model.member.MemberDTO;

import javax.servlet.http.HttpSession;

@RequestMapping("/member")
@Controller
public class MemberController {
	
	@Autowired
	private SqlSession sqlSession;
	//자동 setter 작업
	
	@RequestMapping("/insertForm")
	public String insertForm() {
		return ".main.member.insertForm";
	}
	//팝업창
	@RequestMapping("/agree_TemsofUse.do")
	public String popup1(HttpSession session) {
		
		return "/popup/agree_TemsofUse";
		
	}
	@RequestMapping("/agree_Privacy_popup.do")
	public String popup2(HttpSession session) {
		
		return "/popup/agree_Privacy_popup";
		
	}
	
	//------------------
	//아이디 중복 체크
	@RequestMapping(value="idCheck.do" , method=RequestMethod.POST)
	public String idCheck(HttpServletRequest request, Model model) {
		
		int check=-1;
		String member_id=request.getParameter("member_id");
		MemberDTO memberDTO = sqlSession.selectOne("member.selectOne", member_id);
		
		if(memberDTO==null) {
			check=1;
		}
		
		model.addAttribute("check",check);
		return "/member/idCheck"; //뷰 리턴
	}

	//============================================================
	
	//회원가입
	
	@RequestMapping(value="insertPro.do",method=RequestMethod.POST)
	public String insertPro(@ModelAttribute("memberDTO") MemberDTO memberDTO,
			HttpServletRequest request) {
		
		sqlSession.insert("member.insertMember",memberDTO);
		return ".main.layout"; 
		
	}
	
	//---------------------------
	//로그인 폼
	
	@RequestMapping("/loginForm.do")
	public String loginForm(
			@CookieValue(value= "rememberMemberId", required = false)
			String checkbox, Model model
			) {
		
		
		
		//---------------------------------
	
		
		return ".main.member.loginForm";
	}
	
	//----------------------------
	

	
	//loginPro.do
	
	@RequestMapping(value="loginPro.do", method=RequestMethod.POST)
	public String loginPro(HttpServletRequest request, Model model,
			HttpServletResponse response) {
			
		String member_id = request.getParameter("member_id");
		String member_pw = request.getParameter("member_pw");
		String checkbox = request.getParameter("rememberId");
		
		HashMap <String,String> map=new HashMap<String,String>();
		
		map.put("member_id",member_id);
		map.put("member_pw",member_pw);
		
		MemberDTO dto = sqlSession.selectOne("member.selectLogin" , map);
		
		//쿠키에 아이디 집어넣기 ------------------------------------
		
		Cookie cookie = new Cookie("member_id", member_id);
		
		System.out.println("checkbox");
		if(checkbox != null) {
			//체크박스 여부에 따라 쿠키 넣기말기 정하기
			
			response.addCookie(cookie);
		} else {
			
			// 체크박스 체크 해제되었을 때
						// 쿠키 유효시간 0으로 해서 브라우저에서 삭제하게 한다.
						cookie.setMaxAge(0);
						response.addCookie(cookie);
		}
		
		if(dto == null) {
			
			System.out.println("존재하지 않는 계정입니다.");
			//return "/member/loginForm";
			return ".main.member.loginForm";
		}
		
		//로그인 성공
		model.addAttribute("dto",dto);

	
		return ".main.member.loginSuccess";
		
	}//loginPro-end
	
	//--------------------------
	

	
	//-----------------------------
	
	//로그아웃
	
	@RequestMapping("/logOut.do")
	public String logOut() {
				
		return ".main.member.logOut";
		
	}
	
	//----------------
	
	//업데이트 창 form
	
	@RequestMapping(value="updateMember.do",method=RequestMethod.POST)
	public String updateMember(HttpServletRequest request, Model model) {
		
		String member_id = request.getParameter("member_id");
		
		MemberDTO dto = sqlSession.selectOne("member.selectOne",member_id);
		
		model.addAttribute("dto", dto);
		
		
		return ".main.member.updateMember";
		
	}
	//---
	
		//DB글 수정
		
		@RequestMapping(value="updatePro.do",method=RequestMethod.POST)
		public String updatePro(@ModelAttribute("memberDTO") MemberDTO memberDTO, Model model,HttpServletRequest request) {
			
		
			sqlSession.update("member.updateMember" , memberDTO); //DB를 수정
			
			
			
			//return ".main.layout";
			return ".main.member.updateSuccess";
		}
		
//----
		
		//회원탈퇴
		
		@RequestMapping(value="deleteForm.do",method=RequestMethod.POST)
		public String deleteForm(Model model,HttpServletRequest request) {
			String member_id = request.getParameter("member_id");
			
			model.addAttribute("member_id",member_id);
			
			return ".main.member.deleteForm";
		}
		
		
		//회원탈퇴 DB
		
		@RequestMapping(value="deletePro.do", method=RequestMethod.POST)
		public String deletePro (HttpServletRequest request) {
			String member_id = request.getParameter("member_id");
			String member_pw = request.getParameter("member_pw");
			
			
			System.out.println("member_id :" + member_id);
			System.out.println("member_pw :" + member_pw);
			
			Map<String , String> map = new HashMap<String, String>();
			map.put("member_id", member_id);
			map.put("member_pw", member_pw);
			
			
			
			sqlSession.delete("member.deleteMember" , map);
			return ".main.member.logOut";
		}
		
		
		//-----------------------
		
		//아이디 비밀번호 찾기 메인창
		
		@RequestMapping("/search_main")
		public String search_main () {
			
			return ".main.member.search_main";
		}
		
		//------------------------

		//아이디 찾기 창
		
		@RequestMapping("/search_id")
		public String search_id() {
			
			return ".main.member.search_id";
		}
		
		//------------------------
		
		//비밀번호 찾기 창
		
		@RequestMapping("/search_pwd")
		public String search_pwdForm() {
			
			return ".main.member.search_pwd";
		}

		@RequestMapping(value="search_pwd.do", method=RequestMethod.POST)
		public String search_pwdPro() {
			
			//아이디 정보를 아래로 보내야해			
			
			return ".main.member.search_pwd_next";
		}
		
		
		//비밀번호2 찾기 창
		
		@RequestMapping("/search_pwd_next")
		public String search_pwd_nextForm() {
			
			//위의 아이디정보를 받아서
			//아래의 Pro에게 아이디와 전화번호함께뭐시깽이를 넘겨줘야해
			
			return ".main.member.search_pwd_next";
		}
		
		//pwd_nextform 의 pro친구는 여기서 비교하는거겟지??아이디에 맞는 전화번호를???그리고 그 정보를 토대로 암호를 찾아내야하니까
		//select sql구문을 member.xml에 만들어야 하는걸지도........
		//sql구문을 사용해서 정보를 form result로 넘겨서 화면에보여주면 되는거아닐까?????????????
		//------------------------
		
		
	
}//memberController-end

