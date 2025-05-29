package com.javaweb.repository;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CustomerRepository extends JpaRepository<CustomerEntity, Long>, CustomerRepositoryCustom {
    //select * from customer where fullname LIKE '%fullName%' AND email LIKE '%email%' AND phone LIKE '%phone%'
//    List<CustomerEntity> findByFullNameContainingAndEmailContainingAndPhoneContaining(String fullName, String email, String phone);
//    List<CustomerEntity> findCustomerEntitiesByUsers_Id(Long id);

}
