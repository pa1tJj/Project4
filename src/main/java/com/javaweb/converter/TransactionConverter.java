package com.javaweb.converter;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.TransactionResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TransactionConverter {
    @Autowired
    private ModelMapper modelMapper;

    public TransactionEntity converterToTransactionEntity(TransactionDTO transactionDTO) {
        return modelMapper.map(transactionDTO, TransactionEntity.class);
    }

    public TransactionResponse convertToTransactionResponse(TransactionEntity transactionEntity) {
        return modelMapper.map(transactionEntity, TransactionResponse.class);
    }
}
