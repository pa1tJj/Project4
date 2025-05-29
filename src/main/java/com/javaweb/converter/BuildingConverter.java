package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private RentAreaConverter rentAreaConverter;

    public BuildingEntity toBuildingDTO(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = modelMapper.map(buildingDTO,BuildingEntity.class);
        List<String> types = buildingDTO.getTypeCode();
        String typeResult = types.stream().map(type -> type).collect(Collectors.joining(","));
        buildingEntity.setType(typeResult);
        buildingEntity.setRentAreas(rentAreaConverter.toRentAreaEntityList(buildingDTO, buildingEntity));
        return buildingEntity;
    }

    public BuildingDTO changeBuildingDTO(BuildingEntity buildingEntity) {
        BuildingDTO buildingDTO = modelMapper.map(buildingEntity,BuildingDTO.class);
        List<String> types = new ArrayList<>();
        String[] typeConverter = buildingEntity.getType().split(",");
        for(String it : typeConverter) {
            types.add(it);
        }
        buildingDTO.setTypeCode(types);
        List<RentAreaEntity> rentAreaEntities = buildingEntity.getRentAreas();
        String rentAreas = rentAreaEntities.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
        buildingDTO.setRentArea(rentAreas);
        return buildingDTO;
    }

    public BuildingSearchResponse toBuildingSearchReponse(BuildingEntity buildingEntity) {
        BuildingSearchResponse buildingSearchResponse = modelMapper.map(buildingEntity, BuildingSearchResponse.class);
        buildingSearchResponse.setAddress(buildingEntity.getStreet() + ", " + buildingEntity.getWard() + ", " + districtCode.valueOf(buildingEntity.getDistrict()).getDistrictName() );
        List<RentAreaEntity> rentAreaEntities = buildingEntity.getRentAreas();
        String rentAreas = rentAreaEntities.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
        buildingSearchResponse.setRentArea(rentAreas);
        return buildingSearchResponse;
    }
}
