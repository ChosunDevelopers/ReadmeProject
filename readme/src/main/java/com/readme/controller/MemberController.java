package com.readme.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.readme.dto.BoardLikeVO;
import com.readme.dto.MemberDetailVO;
import com.readme.dto.MemberLikeVO;
import com.readme.dto.MemberProfileVO;
import com.readme.dto.MemberVO;
import com.readme.service.MemberDetailService;
import com.readme.service.MemberService;
import com.readme.utils.UploadFileUtils;

@Controller
@RequestMapping("/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	MemberService mService;
	@Autowired
	MemberDetailService mDetailService;

	@Resource(name = "uploadPath")
	private String uploadPath;

	// 회원가입 동작
		@RequestMapping(value = "/insertMember", method = RequestMethod.POST)
		public String insertMember(MemberVO memberVO, MultipartFile file) throws Exception {

			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = null;

			logger.info("file는 : " + file);

			if (file != null) {
				fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			} else {
				fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
			}

			memberVO.setProfileImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			memberVO.setProfileThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

			int result = mService.insertMember(memberVO);

			if (result == 0) {
//				model.addAttribute("message", "같은 아이디가 있습니다.");
				return "/login/login";
			}
			return "redirect:/index";
		}


	// 로그인 동작
	@RequestMapping(value = "/loginMember", method = RequestMethod.POST)
	public String loginMember(MemberVO memberVO, Model model, HttpSession session) {

		MemberVO result = mService.loginMember(memberVO);

		if (result == null) {
			model.addAttribute("message", "ID혹은 PW가 틀립니다.");
			return "/login/login";
		}
		session.setAttribute("loginID", result.getId());

		return "redirect:/index";
	}

	// test
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(MemberVO memberVO, Model model, HttpSession session) {
		// 로그인 값을 계속 가지고 있는 Session TEST

		System.out.println((String) session.getAttribute("loginID"));
		return "index";
	}

	// 로그아웃 동작
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(MemberVO memberVO, Model model, HttpSession session) {
		session.invalidate();
		// session.setAttrivute("loginID",null);으로 해줘도 된다.
		return "redirect:/index";
	}

	// 회원정보 수정 동작
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String postmemberUpdate(MemberVO memberVO, Model model, MultipartFile file, HttpSession session)throws Exception {

		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		logger.info("file는 : " + file);

		if (file != null) {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		memberVO.setProfileImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		memberVO.setProfileThumbImg(
				File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		int result = 0;
		result = mService.memberUpdate(memberVO);

		if (result == 0) {
			model.addAttribute("message", "Update실패");
			return "redirect:/index";
		}

		return "/login/myPage";
	}

	
	// 추가정보입력 post
	@RequestMapping(value = "/insertMemberDetail", method = RequestMethod.POST)
	public String postmemberAdd(MemberDetailVO memberDetailVO, MultipartFile file) throws Exception {

		String portfolioUploadPath = uploadPath + File.separator + "pfUpload";
		String ymdPath = UploadFileUtils.calcPath(portfolioUploadPath);
		String fileName = file.getOriginalFilename();
		String notImg = "Not Img";
		logger.info("file는 : " + file);

		if (file != null) {
			fileName = UploadFileUtils.fileUpload(portfolioUploadPath, file.getOriginalFilename(), file.getBytes(),
					ymdPath, notImg);
		} else {
			fileName = uploadPath + File.separator + "portfolio" + File.separator;
		}

		memberDetailVO.setPortfolio_path(File.separator + "pfUpload" + ymdPath + File.separator + fileName);
//			memberDetailVO.setPortfolio_thumbnail_path(File.separator + "pfUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		/* memberDetailVO.setPortfolio_name(fileName); */

		int result = mDetailService.updateMemberDetail(memberDetailVO);

		if (result == 0) {
			return "/login/insertMemberDetailPage";
		}
		return "/login/myPage";
	}

	@RequestMapping(value = "/myProfile", method = RequestMethod.GET)
	public String myProfile(MemberProfileVO memberProfileVO, Model model, HttpSession session) {

		MemberProfileVO result = mService.myProfile(memberProfileVO);

		if (result == null) {
			return "/login/myPage";
		}

		model.addAttribute("myProfile", result);
		return "/login/myProfile";
	}
	
	@RequestMapping(value = "/pickTeammate", method = RequestMethod.GET)
	public String pickTeammate(Model model, HttpSession session, MemberProfileVO memberProfileVO) throws Exception{
		String id = (String)session.getAttribute("loginID");
		
		List<MemberLikeVO> pickTeammate = mDetailService.pickTeammate(id);
		model.addAttribute("pickTeammate", pickTeammate);
	
		return "/login/pickTeammate";
	}

	@RequestMapping(value = "/pickBoard", method = RequestMethod.GET)
	public String pickBoard(Model model, HttpSession session) throws Exception{
		String id = (String)session.getAttribute("loginID");
		
		List<BoardLikeVO> pickBoard = mDetailService.pickBoard(id);
		model.addAttribute("pickBoard", pickBoard);
		
		return "/login/pickBoard";
	}
	
	@RequestMapping(value = "/idcheck.do")
    @ResponseBody
    public Map<Object, Object> idcheck(@RequestBody String email) {
        
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
 
        count = mService.idcheck(email);
        map.put("cnt", count);
 
        return map;
    }	
}
