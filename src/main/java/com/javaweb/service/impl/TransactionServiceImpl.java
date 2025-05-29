package com.javaweb.service.impl;

import com.javaweb.converter.TransactionConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.TransactionDetailResponse;
import com.javaweb.model.response.TransactionResponse;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class TransactionServiceImpl implements TransactionService {

    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private TransactionConverter transactionConverter;

    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public List<TransactionResponse> findByCodeAndCustomerId(String code, Long customerId) {
        List<TransactionEntity> transactionEntities = transactionRepository.findByCodeAndCustomer_Id(code, customerId);
        List<TransactionResponse> responses = new ArrayList<>();
        for (TransactionEntity transactionEntity : transactionEntities) {
            TransactionResponse transactionDetailResponse = transactionConverter.convertToTransactionResponse(transactionEntity);
            responses.add(transactionDetailResponse);
        }
        return responses;
    }

    @Override
    public void addOrUpdateTransaction(TransactionDTO transactionDTO) {
        TransactionEntity transactionEntity = transactionConverter.converterToTransactionEntity(transactionDTO);
        CustomerEntity customerEntity = customerRepository.findById(transactionDTO.getCustomerId()).get();
        transactionEntity.setCustomer(customerEntity);
        if(transactionDTO.getId() != null) {
            TransactionEntity oldTransactionEntity = transactionRepository.findById(transactionDTO.getId()).get();
            transactionEntity.setCreatedDate(oldTransactionEntity.getCreatedDate());
            transactionEntity.setCreatedBy(oldTransactionEntity.getCreatedBy());
        }
        transactionRepository.save(transactionEntity);
    }

    @Override
    public ResponseDTO findTransactionById(Long transactionId) {
        TransactionEntity transactionEntity = transactionRepository.findById(transactionId).get();
        TransactionDetailResponse transactionDetailResponse = new TransactionDetailResponse();
        transactionDetailResponse.setNote(transactionEntity.getNote());
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setData(transactionDetailResponse);
        responseDTO.setMessage("success");
        return responseDTO;
    }
}
