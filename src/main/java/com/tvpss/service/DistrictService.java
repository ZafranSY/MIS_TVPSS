package com.tvpss.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tvpss.repository.*;
import com.tvpss.model.*;

@Service
public class DistrictService {
	
	@Autowired
	private DistrictDAO districtDAO;
	
	public List<District>getAllDistrict()
	{
		return districtDAO.getAllDistrict();
	}
}
