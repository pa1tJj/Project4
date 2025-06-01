package com.javaweb.repository.custom;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface BuildingRepositoryCustom {
    public List<BuildingEntity> findBuildings(BuildingSearchRequest buildingSearchRequest, Pageable pageable);
    public int countTotalItem(BuildingSearchResponse buildingSearchResponse);
}
