package com.pinmall.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pinmall.domain.CategoryVO;
import com.pinmall.domain.productVO;
import com.pinmall.service.AdProductService;
import com.pinmall.util.FileUtils;
import com.pinmall.util.PageMaker;
import com.pinmall.util.SearchCriteria;

@Controller
@RequestMapping("/admin/product/*")
public class AdProductController {

	@Inject
	private AdProductService service;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	private static final Logger logger = LoggerFactory.getLogger(AdProductController.class);
	
	//상품업로드 페이지
	@RequestMapping(value = "insert",method = RequestMethod.GET)
	public void insertGET(Model model) throws Exception{
		logger.info("====상품업로드");
		model.addAttribute("cateList", service.mainCGList());
		logger.info(model.toString());
	}
	
	//1차카테고리에 따른 2차 카테고리 출력
	@ResponseBody
	@RequestMapping(value="subCGList/{cate_ncategory}",method = RequestMethod.GET)
	public ResponseEntity<List<CategoryVO>> subCGListPOST(@PathVariable("cate_ncategory") String cate_ncategory){
		logger.info("===== 2차카테고리 출력");
		//2차카테고리 출력
		
		ResponseEntity<List<CategoryVO>> entity = null;
		try {
			
			entity = new ResponseEntity<List<CategoryVO>>(service.subCGList(cate_ncategory), HttpStatus.OK);
			logger.info(entity.toString());
		} catch(Exception ex) {
			entity = new ResponseEntity<List<CategoryVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//상품이미지 
	@RequestMapping(value = "imgUpload", method = RequestMethod.POST)
	public void imgUpload(HttpServletRequest req, HttpServletResponse res, MultipartFile upload) {
		
		logger.info("업로드 진행중");
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset-utf-8");
		
		try {
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			
			String uploadPath = req.getSession().getServletContext().getRealPath("/");
			uploadPath = uploadPath + "resources\\upload\\" + fileName;
			
			logger.info("uploadPath진행중:" + uploadPath);
			
			out = new FileOutputStream(new File(uploadPath));
			
			out.write(bytes);
			
			printWriter = res.getWriter();
			
			String fileUrl = "/upload/" + fileName;
			
			printWriter.println("{\"filename\":\"" + fileName + "\", \"uploaded\":1,\"url\":\"" + fileUrl + "\"}");
			printWriter.flush();
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(out != null) {
				try {out.close();}catch(Exception ex) {ex.printStackTrace();}
			}
			if(printWriter != null) {
				try {printWriter.close();}catch(Exception ex) {ex.printStackTrace();}
			}
			
		}
		
	} 
	
	//파일 출력
	@ResponseBody
	@RequestMapping(value = "displayFile",method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		
		return FileUtils.getFile(uploadPath, fileName);
	}
	
	
	//이미지 파일 삭제
	public void deleteFile(String fileName) {
		logger.info("delete진행중" + fileName);
		
		FileUtils.deleteFile(uploadPath, fileName);
	}
	
	//상품 업로드
	@RequestMapping(value = "insert",method = RequestMethod.POST)
	public String insertPOST(productVO vo, RedirectAttributes redirect) throws Exception{
		
		logger.info("상품 업로드 작업 실행");
		logger.info(vo.toString());
		
		vo.setPdt_img(FileUtils.uploadFile(uploadPath, vo.getFile1().getOriginalFilename(), vo.getFile1().getBytes()));
		service.insertPOST(vo);
		
		redirect.addFlashAttribute("msg", "INSERT_SUCCESS");
		
		return "redirect:/admin/product/list";
	}
	
	//상품리스트
	@RequestMapping(value = "list",method = RequestMethod.GET)
	public void productList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		logger.info("상품리스트 진행중"+cri.toString());
	
	model.addAttribute("productList", service.searchList(cri));
		
	PageMaker pm = new PageMaker();
	pm.setCri(cri);
	
	int Count = service.searchListCount(cri);
	pm.setTotalCount(Count);
	
	model.addAttribute("pm", pm);
	}
	
	//상품삭제
	@RequestMapping(value = "delete",method = RequestMethod.POST)
	public String deletePOST(SearchCriteria cri, @RequestParam("pdt_nb") int pdt_nb,
							@RequestParam("pdt_img") String pdt_img, RedirectAttributes redirect) throws Exception{	
		logger.info("이미지 삭제 진행");
		
		//이미지 삭제
		deleteFile(pdt_img);
		
		// 상품 삭제
		service.productDelete(pdt_nb);
		redirect.addFlashAttribute("cri",cri);
		redirect.addFlashAttribute("msg","DELETE_SUCCESS");
		
		
		return "redirect:/admin/product/list";
	}
	
	//상품수정(GET)
	@RequestMapping(value = "edit",method = RequestMethod.GET)
	public void EditGET(@ModelAttribute("cri") SearchCriteria cri, Model model,
										@RequestParam("pdt_nb") int pdt_nb) throws Exception{
		logger.info("상품수정폼 진행");
		
		productVO vo = service.editGET(pdt_nb);
		
		
		List<CategoryVO> subCateList = service.subCGList(vo.getCate_pcategory());
		
		String originFile = vo.getPdt_img().substring(vo.getPdt_img().lastIndexOf("_")+1);
		
		model.addAttribute("vo", vo);
		model.addAttribute("originFile", originFile);
		model.addAttribute("cateList", service.mainCGList());
		model.addAttribute("subCateList", subCateList);
		
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		
		model.addAttribute("pm", pm);
	}	
	
	//상품수정(POST)
	@RequestMapping(value = "edit",method = RequestMethod.POST)
	public String EditPOST(productVO vo, SearchCriteria cri,RedirectAttributes redirect) throws Exception{
		logger.info("상품 수정 진행");
		logger.info(vo.toString()+"======="+cri.toString());
		
		
		if(vo.getFile1().getSize() > 0) {
			vo.setPdt_img(FileUtils.uploadFile(uploadPath, vo.getFile1().getOriginalFilename(), vo.getFile1().getBytes()));
		}
			
		service.editPOST(vo);
		
		redirect.addFlashAttribute("cri", cri);
		redirect.addFlashAttribute("msg", "EDIT_SUCCESS");		
		
		return "redirect:/admin/product/list";
	}
	
	//선택상품 삭제
	@ResponseBody
	@RequestMapping(value = "deleteChecked",method = RequestMethod.POST)
	public ResponseEntity<String> deleteCheked(@RequestParam("checkArr[]") List<Integer> checkArr,
												@RequestParam("imgArr[]") List<String> imgArr){
		
		logger.info("선택삭제");
		ResponseEntity<String> entity = null;
		
		try {
			
			for(int i=0;i<checkArr.size(); i++) {
				
				deleteFile(imgArr.get(i));
				
				service.productDelete(checkArr.get(i));
				
			}
			entity = new ResponseEntity<String>(HttpStatus.OK);
			
		} catch(Exception ex) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			
		}
		
			
	return entity;
	}
	
}