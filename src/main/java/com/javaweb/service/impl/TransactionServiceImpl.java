package com.javaweb.service.impl;

import com.javaweb.converter.TransactionDTOConverter;
import com.javaweb.converter.TransactionEntityConverter;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.TransactionDetailResponse;
import com.javaweb.model.response.TransactionResponse;
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
    private TransactionEntityConverter transactionEntityConverter;
    @Autowired
    private TransactionDTOConverter transactionDTOConverter;

    @Override
    public List<TransactionResponse> findByCodeAndCustomerId(String code, Long customerId) {
        List<TransactionEntity> transactionEntities = transactionRepository.findByCodeAndCustomer_Id(code, customerId);
        List<TransactionResponse> responses = new ArrayList<>();
        for (TransactionEntity transactionEntity : transactionEntities) {
            TransactionResponse transactionDetailResponse = transactionEntityConverter.convertToTransactionResponse(transactionEntity);
            responses.add(transactionDetailResponse);
        }
        return responses;
    }

    @Override
    public void addOrUpdateTransaction(TransactionDTO transactionDTO) {
        TransactionEntity transactionEntity = transactionDTOConverter.converterToTransactionEntity(transactionDTO);
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
