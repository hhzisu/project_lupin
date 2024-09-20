package com.boot.project_lupin.controller;

import com.boot.project_lupin.dto.WishDTO;
import com.boot.project_lupin.service.WishService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
public class WishController {

	@Autowired
	private WishService service;

	@PostMapping("/wish")
	@ResponseBody
	public String wishInsert(@RequestParam int auction_id, @RequestParam int user_id) {
		WishDTO wishDTO = new WishDTO();
		wishDTO.setAuction_id(auction_id);
		wishDTO.setUser_id(user_id);
		service.wishInsert(wishDTO);
		return "OK";
	}

	@PostMapping("/unwish")
	@ResponseBody
	public String wishDelete(@RequestParam int auction_id, @RequestParam int user_id) {
		WishDTO wishDTO = new WishDTO();
		wishDTO.setAuction_id(auction_id);
		wishDTO.setUser_id(user_id);
		service.wishDelete(wishDTO);
		return "OK";
	}

	@GetMapping("/wish/state")
	@ResponseBody
	public boolean wishState(@RequestParam int auction_id, @RequestParam int user_id) {
		WishDTO wishDTO = new WishDTO();
		wishDTO.setAuction_id(auction_id);
		wishDTO.setUser_id(user_id);
		return service.wishState(wishDTO);
	}
}
