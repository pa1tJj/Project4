package com.javaweb.repository.custom;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;

import java.util.List;
import java.util.Map;

public interface BuildingRepositoryCustom {
    public List<BuildingEntity> findBuildings(BuildingSearchRequest buildingSearchRequest);

    public int countTotalItem(BuildingSearchResponse buildingSearchResponse);
}
