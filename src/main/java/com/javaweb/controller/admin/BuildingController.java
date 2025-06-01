package com.javaweb.controller.admin;

import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.BuildingService;
import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private IUserService userService;
    @Autowired
    private BuildingService buildingService;

    @RequestMapping(value = "/admin/building-list", method = RequestMethod.GET)
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/list");
        mav.addObject("modelSearch", buildingSearchRequest);
        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")) {
            Long staffId = SecurityUtils.getPrincipal().getId();
            buildingSearchRequest.setStaffId(staffId);
            List<BuildingSearchResponse> buildings = buildingService.findBuildings(buildingSearchRequest, PageRequest.of(buildingSearchRequest.getPage() - 1, buildingSearchRequest.getMaxPageItems()));
            BuildingSearchResponse buildingSearchResponse = new BuildingSearchResponse();
            buildingSearchResponse.setListResult(buildings);
            buildingSearchResponse.setTotalItems(buildingService.countTotalItems(buildings));
            mav.addObject("buildingList", buildingSearchResponse);
        } else {
            List<BuildingSearchResponse> buildings = buildingService.findBuildings(buildingSearchRequest, PageRequest.of(buildingSearchRequest.getPage() - 1, buildingSearchRequest.getMaxPageItems()));
            BuildingSearchResponse buildingSearchResponse = new BuildingSearchResponse();
            buildingSearchResponse.setListResult(buildings);
            buildingSearchResponse.setTotalItems(buildingService.countTotalItems(buildings));
            mav.addObject("buildingList", buildingSearchResponse);
        }

        mav.addObject("listStaff", userService.getStaffs());
        mav.addObject("districts", districtCode.type());
        mav.addObject("buildingTypeCode", buildingType.type());
        return mav;
    }

    @RequestMapping(value = "/admin/building-edit", method = RequestMethod.GET)
    public ModelAndView buildingEdit(@ModelAttribute("buildingEdit") BuildingDTO buildingDTO, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("districts", districtCode.type());
        mav.addObject("buildingTypeCode", buildingType.type());
        return mav;
    }

    @RequestMapping(value = "/admin/building-edit-{id}", method = RequestMethod.GET)
    public ModelAndView buildingEdit(@PathVariable("id") Long id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        //xuống DB tìm building theo id
        BuildingDTO buildingDTO = buildingService.findByIdAndResponse(id);
        mav.addObject("buildingEdit", buildingDTO);
        mav.addObject("districts", districtCode.type());
        mav.addObject("buildingTypeCode", buildingType.type());
        return mav;
    }
}
