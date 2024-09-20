package com.boot.project_lupin.controller;

import com.boot.project_lupin.dto.AuctionAttachDTO;
import com.boot.project_lupin.dto.AuctionDTO;
import com.boot.project_lupin.service.AuctionService;
import com.boot.project_lupin.service.ManagerService;
import jakarta.servlet.ServletContext;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
public class LoginController {

	@Autowired
	private ServletContext servletContext;

	@RequestMapping("/adminLogin")
	public String adminLogin() {
		return "adminLogin";
	}


}
