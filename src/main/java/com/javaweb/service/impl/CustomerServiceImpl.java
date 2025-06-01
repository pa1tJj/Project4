package com.javaweb.service.impl;

import com.javaweb.converter.CustomerConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private CustomerConverter customerConverter;

    @Autowired
    private UserRepository userRepository;

    @Override
    public ResponseDTO listStaffs(Long customerId) {
        CustomerEntity customerEntity = customerRepository.findById(customerId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> staffAssignment = customerEntity.getUsers();
        List<StaffResponseDTO> staffResponseDTOs = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for(UserEntity userEntity : staffs) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(userEntity.getFullName());
            staffResponseDTO.setStaffId(userEntity.getId());
            if(staffAssignment.contains(userEntity)) {
                staffResponseDTO.setChecked("checked");
            } else {
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOs.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOs);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public List<CustomerSearchResponse> findCustomers(CustomerSearchRequest customerSearchRequest, Pageable pageable) {
        List<CustomerSearchResponse> customerSearchResponseList = new ArrayList<>();
        List<CustomerEntity> customerEntities = customerRepository.findCustomers(customerSearchRequest);
        for(CustomerEntity customerEntity : customerEntities) {
            CustomerSearchResponse customerSearchResponse = customerConverter.convertCustomerEntityToCustomerSearchResponse(customerEntity);
            customerSearchResponseList.add(customerSearchResponse);
        }
        return customerSearchResponseList;
    }

    @Override
    public void addOrUpdateCustomer(CustomerDTO customerDTO) {
        CustomerEntity customerEntity = customerConverter.convertCustomerDTOToCustomerEntity(customerDTO);
        if(customerDTO.getId() != null) {
            CustomerEntity oldCustomerEntity = customerRepository.findById(customerDTO.getId()).get();
            customerEntity.setCreatedDate(oldCustomerEntity.getCreatedDate());
            customerEntity.setCreatedBy(oldCustomerEntity.getCreatedBy());
        }
        customerRepository.save(customerEntity);
    }

    @Override
    public CustomerSearchResponse findCustomerById(Long id) {
        CustomerEntity customerEntity = customerRepository.findById(id).get();
        CustomerSearchResponse customerSearchResponse = customerConverter.convertCustomerEntityToCustomerSearchResponse(customerEntity);
        return customerSearchResponse;
    }


    @Override
    public void assignmentCustomerForStaff(AssignmentCustomerDTO assignmentCustomerDTO) {
        CustomerEntity customerEntity = customerRepository.findById(assignmentCustomerDTO.getCustomerId()).get();
        List<UserEntity> staffs = userRepository.findByIdIn(assignmentCustomerDTO.getStaffs());
        customerEntity.setUsers(staffs);
        customerRepository.save(customerEntity);
    }

    @Override
    public void deleteCustomer(List<Long> ids) {
        if(ids != null || !ids.isEmpty()) {
//            customerRepository.deleteByIdIn(ids);
//            customerRepository.deleteCustomers(ids);
            for(Long id : ids) {
                CustomerEntity customerEntity = customerRepository.findById(id).get();
                customerEntity.setActive(0L);
                customerRepository.save(customerEntity);
            }

        }
    }

    @Override
    public int countTotalItems(List<CustomerSearchResponse> customerSearchResponses) {
        int totalItems = 0;
        for(CustomerSearchResponse item : customerSearchResponses) {
            totalItems += customerRepository.countTotalItem(item);
        }
        return totalItems;
    }

}
