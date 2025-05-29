package com.javaweb.model.dto;

import java.util.List;

public class AssignmentCustomerDTO extends AbstractDTO{
    public List<Long> staffs;
    public Long customerId;

    public List<Long> getStaffs() {
        return staffs;
    }

    public void setStaffs(List<Long> staffs) {
        this.staffs = staffs;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }
}
