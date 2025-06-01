package com.javaweb.repository.custom.impl;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.custom.CustomerRepositoryCustom;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.List;

public class CustomerRepositoryImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    public void joinTable(CustomerSearchRequest customerSearchRequest, StringBuilder sql) {
        Long staffId = customerSearchRequest.getStaffId();
        if (staffId != null) {
            sql.append(" JOIN assignmentcustomer a ON c.id = a.customerid ");
        }
    }

    public void query(CustomerSearchRequest customerSearchRequest, StringBuilder sql) {
        Long staffId = customerSearchRequest.getStaffId();
        if(staffId != null) {
            sql.append(" AND a.staffid = " + staffId);
        }
        try {
            Field[] fields = CustomerSearchRequest.class.getDeclaredFields();
            for (Field it : fields) {
                it.setAccessible(true);
                String fieldName = it.getName();
                if (!fieldName.equals("staffId")) {
                    Object value = it.get(customerSearchRequest);
                    if (value != null) {
                        if (it.getType().getName().equals("java.lang.Long") || it.getType().getName().equals("java.lang.Integer")) {
                            sql.append(" AND c." + fieldName + " = " + value);
                        } else if (it.getType().getName().equals("java.lang.String") && !value.equals("")) {
                            sql.append(" AND c." + fieldName + " LIKE '%" + value + "%'");
                        }
                    }
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<CustomerEntity> findCustomers(CustomerSearchRequest customerSearchRequest) {
        StringBuilder sql = new StringBuilder("select * from customer c ");
        joinTable(customerSearchRequest, sql);
        StringBuilder where = new StringBuilder(" WHERE 1 = 1 AND c.is_active = 1 ");
        query(customerSearchRequest, where);
        sql.append(where);
        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        return query.getResultList();
    }

    @Override
    public void deleteCustomers(List<Long> ids) {
        for(Long id : ids) {
            //ver 1:
            StringBuilder sql = new StringBuilder("UPDATE customer SET is_active = 0 WHERE id =  " + id);
            Query query =  entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
            query.executeUpdate();
        }
    }

    @Override
    public int countTotalItem(CustomerSearchResponse customerSearchResponse) {
        String sql = buildQueryFilter(customerSearchResponse.getId());
        Query query = entityManager.createNativeQuery(sql);
        return query.getResultList().size();
    }

    private String buildQueryFilter(Long id) {
        String sql = "SELECT *FROM customer c WHERE c.id =" + id;
        return sql;
    }
}
