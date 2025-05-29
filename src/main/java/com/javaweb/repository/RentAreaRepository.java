package com.javaweb.repository;

import com.javaweb.entity.RentAreaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Collection;
import java.util.List;

public interface RentAreaRepository extends JpaRepository<RentAreaEntity, Long> {
    void deleteByBuilding_IdIn(Collection<Long> buildingIds);

    void deleteByBuilding_Id(Long buildingId);
}
