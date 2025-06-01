package com.javaweb.repository.custom;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CustomerRepositoryCustom{
    public List<CustomerEntity> findCustomers(CustomerSearchRequest customerSearchRequest);
    public void deleteCustomers(List<Long> ids);
    int countTotalItem(CustomerSearchResponse customerSearchResponse);
}
