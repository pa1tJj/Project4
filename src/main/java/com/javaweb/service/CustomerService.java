package com.javaweb.service;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface CustomerService {
    public List<CustomerSearchResponse> findCustomers(CustomerSearchRequest customerSearchRequest);

    public void addOrUpdateCustomer(CustomerDTO customerDTO);

    public CustomerSearchResponse findCustomerById(Long id);

    public ResponseDTO listStaffs(Long customerId);

    public void assignmentCustomerForStaff(AssignmentCustomerDTO assignmentCustomerDTO);

    public void deleteCustomer(List<Long> ids);
}
