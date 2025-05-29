package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.RentAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class RentAreaServiceImpl implements RentAreaService {

    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Override
    public void saveRentArea(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        rentAreaRepository.deleteByBuilding_Id(buildingEntity.getId());
        String[] values = buildingDTO.getRentArea().trim().split(",");
        for(String val : values) {
            RentAreaEntity rentAreaEntity = new RentAreaEntity();
            rentAreaEntity.setBuilding(buildingEntity);
            rentAreaEntity.setValue(Long.parseLong(val));
            rentAreaRepository.save(rentAreaEntity);
        }
    }
}
