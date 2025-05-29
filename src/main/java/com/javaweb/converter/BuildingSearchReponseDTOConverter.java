package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.districtCode;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingSearchReponseDTOConverter {
    @Autowired
    private ModelMapper modelMapper;

    public BuildingSearchResponse toBuildingSearchReponse(BuildingEntity buildingEntity) {
        BuildingSearchResponse buildingSearchResponse = modelMapper.map(buildingEntity, BuildingSearchResponse.class);
        buildingSearchResponse.setAddress(buildingEntity.getStreet() + ", " + buildingEntity.getWard() + ", " + districtCode.valueOf(buildingEntity.getDistrict()).getDistrictName() );
        List<RentAreaEntity> rentAreaEntities = buildingEntity.getRentAreas();
        String rentAreas = rentAreaEntities.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
        buildingSearchResponse.setRentArea(rentAreas);
        return buildingSearchResponse;
    }
}
