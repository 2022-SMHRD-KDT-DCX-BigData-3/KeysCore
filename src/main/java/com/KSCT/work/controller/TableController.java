package com.KSCT.work.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.KSCT.work.service.TableService;

@RestController
public class TableController {

	@Resource
	private TableService tableService;
	
	@RequestMapping(value="list")
	public ModelAndView AllListView(Map<String, Object> map) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		List<Map<String, Object>> AllList = tableService.SelectAllList();
		
		mav.addObject("AllList", AllList);
		mav.setViewName("list");
		return mav;
	}
}
