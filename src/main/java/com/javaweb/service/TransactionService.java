package com.javaweb.service;

import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.TransactionResponse;

import java.util.List;

public interface TransactionService {
    List<TransactionResponse> findByCodeAndCustomerId(String code, Long customerId);
    public void addOrUpdateTransaction(TransactionDTO transactionDTO);

    public ResponseDTO findTransactionById(Long transactionId);
}
