package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingEntityConverter {
    @Autowired
    private ModelMapper modelMapper;
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
}
