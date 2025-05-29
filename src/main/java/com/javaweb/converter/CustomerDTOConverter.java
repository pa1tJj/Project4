package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CustomerDTOConverter {
    @Autowired
    private ModelMapper modelMapper;

    public CustomerEntity convertCustomerDTOToCustomerEntity(CustomerDTO customerDTO) {
        CustomerEntity customerEntity = modelMapper.map(customerDTO, CustomerEntity.class);
        return customerEntity;
    }
}
