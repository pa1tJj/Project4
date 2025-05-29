package com.javaweb.service;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface BuildingService {
    ResponseDTO listStaffs(Long buildingId);

    public List<BuildingSearchResponse> findBuildings(BuildingSearchRequest buildingSearchRequest);

    public void addOrUpdateBuilding(BuildingDTO buildingDTO);

    public BuildingDTO findByIdAndResponse(Long id);

    public void deleteBuilding(List<Long> ids);

    public void assignmentBuildingForStaff(AssignmentBuildingDTO assignmentBuildingDTO);

}
