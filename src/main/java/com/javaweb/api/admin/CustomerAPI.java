package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.CustomerService;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/customer")
public class CustomerAPI {
    @Autowired
    private CustomerService customerService;

    @Autowired
    private TransactionService transactionService;

    @PostMapping
    public void addOrUpdateCustomer(@RequestBody CustomerDTO customerDTO) {
        customerService.addOrUpdateCustomer(customerDTO);
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id) {
        ResponseDTO result = customerService.listStaffs(id);
        return result;
    }

    @PostMapping("/assignment")
    public void assignmentCustomerToStaff(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO) {
        customerService.assignmentCustomerForStaff(assignmentCustomerDTO);
    }

    @PostMapping("/transaction")
    public void addOrUpdateTransaction(@RequestBody TransactionDTO transactionDTO) {
        transactionService.addOrUpdateTransaction(transactionDTO);
    }

    @GetMapping("/{id}/transaction-detail")
    public ResponseDTO updateTransaction(@PathVariable Long id) {
        ResponseDTO responseDTO = transactionService.findTransactionById(id);
        return responseDTO;
    }

    @DeleteMapping(value = "/{ids}")
    public void deleteCustomer(@PathVariable List<Long> ids) {
        customerService.deleteCustomer(ids);
    }
}
