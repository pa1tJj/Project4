package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.response.CustomerSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CustomerEntityConverter {
    @Autowired
    private ModelMapper modelMapper;

    public CustomerSearchResponse convertCustomerEntityToCustomerSearchResponse(CustomerEntity customerEntity) {
        return modelMapper.map(customerEntity, CustomerSearchResponse.class);
    }
}
