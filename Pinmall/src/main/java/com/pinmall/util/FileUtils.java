package com.pinmall.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.commons.io.IOUtils;
import org.imgscalr.Scalr;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;

/*
 * 웹 프로젝트 외부 영역에 존재하는 파일작업을  하기 위한 유틸
 */
public class FileUtils {
	/*
	 * 파일 업로드

	 */
	public static String uploadFile(String uploadPath, String originName, byte[] fileData) throws Exception{
	
		System.out.println("=====uploadFile() execute..."); 
		
		
		UUID uuid = UUID.randomUUID(); 
		String savedName = uuid.toString() + "_" + originName;
		String savedPath = calcPath(uploadPath); 
		File target = new File(uploadPath + savedPath, savedName);
		FileCopyUtils.copy(fileData, target);
		
		
		// 확장자 명만 가져옴 썸네일 작업
		String formatName = originName.substring(originName.lastIndexOf(".") +1);
		String uploadFileName = null;
		
		if(MediaUtils.getMediaType(formatName) != null) {
			uploadFileName = makeThumbNail(uploadPath, savedPath, savedName);
			
		} else {
			uploadFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		
		return uploadFileName;
	}
	
	
	/*
	 * 날짜 폴더 경로 설정 메소드
	 */
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		System.out.println("=====calcPath result: " + datePath);
		
		// 경로 별 모든 폴더 생성
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		return datePath;
	}
	
	
	/*
	 * 폴더 생성 메소드
	 */
	private static void makeDir(String uploadPath, String... paths) {
		
		// 가장 마지막 매개변수의 폴더가 존재하는지 확인
		if(new File(paths[paths.length - 1]).exists()) {
			return;
		}
		
		// 매개변수로 들어온 경로의 모든 폴더 생성
		for(String path: paths) {
			File dirPath = new File(uploadPath + path);
			// 해당 폴더가 존재하지 않으면
			if(!dirPath.exists()) {
				dirPath.mkdir(); // 폴더 생성
			}
		}
	}
	
	
	/*
	 * 이미지 파일의 썸네일 생성 메소드
	 */
	private static String makeThumbNail(String uploadPath, String path, String fileName) throws Exception {
	
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		// 썸네일 높이를 80px로 하고 너비를 맞춤
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 120);
		
		// 썸네일 생성 준비 
		String thumbNailName = uploadPath + path + File.separator + "s_" + fileName;
		File newFile = new File(thumbNailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		
		// 썸네일 생성
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		// 생성한 썸네일 경로의 subString을 반환
		System.out.println("=====makeThumbNail() thumbNail: " + thumbNailName); 
		return thumbNailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	
	/*
	 * 일반 파일의 아이콘 생성 메소드
	 */
	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception{
		String iconName = uploadPath + path + File.separator + fileName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	
	/*
	 * 파일 가져옴
	 * 웹 프로젝트 외부 영역의 파일을 가져와
	 * ResponseEntity로 반환
	 */
	public static ResponseEntity<byte[]> getFile(String uploadPath, String fileName) throws Exception {
		
		InputStream in = null;
		byte[] fileData = null;
		ResponseEntity<byte[]> entity = null;
		
		try {
			// 파일의 확장자로 파일 종류 확인
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType type = MediaUtils.getMediaType(formatName);
			
			// 파일 헤더 설정
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(type);
			
			// 파일 가져옴
			in = new FileInputStream(uploadPath + fileName);

			// entity 생성
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			
		} finally {
			in.close();
		}
		
		return entity;
	}
	
	/*
	 * 이미지 파일 삭제
	 * 
	 * @Params 
	 * String uploadPath : 파일 경로
	 * String fileName : 삭제할 파일
	 * 
	 */
	public static void deleteFile(String uploadPath, String fileName) {
		
		//  날짜경로+ UUID_fileName
		String front = fileName.substring(0, 12); 	// 날짜 경로
		String end = fileName.substring(14); 		// UUID_fileName
		String origin = front + end;
		
		new File(uploadPath+origin.replace('/', File.separatorChar)).delete(); 		// 원본 파일 지우기
		new File(uploadPath+fileName.replace('/', File.separatorChar)).delete(); 	// 썸네일 파일 지우기
	}
	
	
	/*
	 * 썸네일 파일명 -> 원래 파일명
	 */
	public static String thumbToOriginName(String thumbnailName) {
		String front = thumbnailName.substring(0, 12); 	
		String end = thumbnailName.substring(14); 		
		
		return front+end;
		
	}
	
	
	
	
}
