package com.boot.project_lupin.service;

import com.boot.project_lupin.dao.QuestionDAO;
import com.boot.project_lupin.dto.QuestionAttachDTO;
import com.boot.project_lupin.dto.QuestionDTO;
import jakarta.servlet.ServletContext;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import lombok.extern.slf4j.Slf4j;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service("QuestionService")
public class QuestionService{
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private ServletContext servletContext;  // 프로젝트 경로를 얻기 위한 ServletContext

	//문의 등록
	public void insertQuestion(QuestionDTO questionDTO) {
		log.info("@# QuestionService insertQuestion");
		
		QuestionDAO dao = sqlSession.getMapper(QuestionDAO.class);
		dao.insertQuestion(questionDTO);

		//첨부파일 있는지 체크
		log.info("@# questionDTO.getQuestionAttachList()=>"+questionDTO.getQuestionAttachList());
		if (questionDTO.getQuestionAttachList() == null || questionDTO.getQuestionAttachList().size() == 0) {
			log.info("@# null");
			return;
		}

		//첨부파일이 있는 경우 처리
		questionDTO.getQuestionAttachList().forEach(attach -> {
			attach.setQuestion_id(questionDTO.getQuestion_id());
			dao.questionInsertFile(attach);
		});
	}

	// 답변 등록
	public void questionAnswer(QuestionDTO questionDTO){
		log.info("@# QuestionService questionAwnser");

		QuestionDAO dao = sqlSession.getMapper(QuestionDAO.class);
		dao.questionAnswer(questionDTO);
	}

	//문의 리스트 가져오기
	public ArrayList<QuestionDTO> questionListbyId(long user_id){
		log.info("@# QuestionService questionList");

		QuestionDAO dao = sqlSession.getMapper(QuestionDAO.class);
		ArrayList<QuestionDTO> list = dao.questionListbyId(user_id);

		return list;
	}
	//문의 리스트 가져오기
	public ArrayList<QuestionDTO> questionList(){
		log.info("@# QuestionService questionList");

		QuestionDAO dao = sqlSession.getMapper(QuestionDAO.class);
		ArrayList<QuestionDTO> list = dao.questionList();

		return list;
	}


	//파일 리스트 가져오기
	public List<QuestionAttachDTO> questionGetFileList(int question_id){
		log.info("@# QuestionService questionGetFileList");

		QuestionDAO dao = sqlSession.getMapper(QuestionDAO.class);

		return dao.questionGetFileList(question_id);
	}
	//파일 삭제
	public void questionDeleteFile(List<QuestionAttachDTO> fileList) {
		if (fileList == null || fileList.size() == 0) {
			return;
		}

		fileList.forEach(attach -> {
			try {
				// 프로젝트 내부의 업로드 경로 설정
				Path file = Paths.get(servletContext.getRealPath("/upload/") + attach.getUploadPath() + "/"
						+ attach.getUuid() + "_" + attach.getFileName());
				Files.deleteIfExists(file);  // 파일이 있으면 삭제

				// 이미지 파일이면 썸네일도 삭제
				if (Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get(servletContext.getRealPath("/upload/") + attach.getUploadPath() + "/s_"
							+ attach.getUuid() + "_" + attach.getFileName());
					Files.deleteIfExists(thumbNail);  // 썸네일 삭제
				}
			} catch (Exception e) {
				log.error("delete file error: " + e.getMessage());
			}
		});
	}
}

