package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class RentAreaConverter {

    public RentAreaEntity returnRentAreaEntity(Long value, BuildingEntity buildingEntity) {
        RentAreaEntity rentArea = new RentAreaEntity();
        rentArea.setBuilding(buildingEntity);
        rentArea.setValue(value);
        return rentArea;
    }
    public List<RentAreaEntity> toRentAreaEntityList(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        String[] values = buildingDTO.getRentArea().split(",");
        List<RentAreaEntity> rentAreaEntities = new ArrayList<>();
        for(String val : values) {
            rentAreaEntities.add(returnRentAreaEntity(Long.parseLong(val), buildingEntity));
        }
        return rentAreaEntities;
    }
}
