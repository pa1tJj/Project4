package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;

public interface RentAreaService {
    public  void saveRentArea(BuildingDTO buildingDTO, BuildingEntity buildingEntity);
}
