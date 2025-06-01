package com.javaweb.controller.admin;

import com.javaweb.enums.TransactionType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.CustomerService;
import com.javaweb.service.IUserService;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller(value="customerControllerOfAdmin")
public class CustomerController {
    @Autowired
    private IUserService userService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private TransactionService transactionService;

    @RequestMapping(value = "/admin/customer-list", method = RequestMethod.GET)
    public ModelAndView customerList(@ModelAttribute CustomerSearchRequest customerSearchRequest, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/list");
        mav.addObject("modelSearch", customerSearchRequest);
        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")) {
            Long staffId = SecurityUtils.getPrincipal().getId();
            customerSearchRequest.setStaffId(staffId);
            List<CustomerSearchResponse> customers = customerService.findCustomers(customerSearchRequest, PageRequest.of(customerSearchRequest.getPage() -1, customerSearchRequest.getMaxPageItems()));
            CustomerSearchResponse customerSearchResponse = new CustomerSearchResponse();
            customerSearchResponse.setListResult(customers);
            customerSearchResponse.setTotalItems(customerService.countTotalItems(customers));
            mav.addObject("customerList", customerSearchResponse);
        } else {
            List<CustomerSearchResponse> customers = customerService.findCustomers(customerSearchRequest, PageRequest.of(customerSearchRequest.getPage() -1, customerSearchRequest.getMaxPageItems()));
            CustomerSearchResponse customerSearchResponse = new CustomerSearchResponse();
            customerSearchResponse.setListResult(customers);
            customerSearchResponse.setTotalItems(customerService.countTotalItems(customers));
            mav.addObject("customerList", customerSearchResponse);
        }

        mav.addObject("listStaffs", userService.getStaffs());
        return mav;
    }

    @RequestMapping(value = "/admin/customer-edit", method = RequestMethod.GET)
    public ModelAndView customerEdit(@ModelAttribute CustomerDTO customerDTO, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        mav.addObject("customerEdit", customerDTO);
        return mav;
    }

    @RequestMapping(value = "/admin/customer-edit-{id}", method = RequestMethod.GET)
    public ModelAndView customerEdit(@PathVariable("id") Long id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        CustomerSearchResponse customerSearchResponse = customerService.findCustomerById(id);
        mav.addObject("customerEdit", customerSearchResponse);
        mav.addObject("transactionType", TransactionType.type());
        //2 loại giao dịch findByCodeAndCustomerId
        //listType1: CSKH
        mav.addObject("typeCSKH", transactionService.findByCodeAndCustomerId("CSKH", id));
        //listType2: DDX
        mav.addObject("typeDDX", transactionService.findByCodeAndCustomerId("DDX", id));
        return mav;
    }
}
