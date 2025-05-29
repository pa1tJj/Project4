package com.javaweb.converter;

import com.javaweb.config.BuildingImagePath;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingDTOConverter {
    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private RentAreaConverter rentAreaConverter;

    @Autowired
    private BuildingImagePath buildingImagePath;

    public BuildingEntity toBuildingDTO(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = modelMapper.map(buildingDTO,BuildingEntity.class);
        List<String> types = buildingDTO.getTypeCode();
        String typeResult = types.stream().map(type -> type).collect(Collectors.joining(","));
        buildingEntity.setType(typeResult);
        buildingEntity.setRentAreas(rentAreaConverter.toRentAreaEntityList(buildingDTO, buildingEntity));
        return buildingEntity;
    }
}
