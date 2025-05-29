package com.javaweb.converter;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.response.TransactionResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TransactionEntityConverter {
    @Autowired
    private ModelMapper modelMapper;

    public TransactionResponse convertToTransactionResponse(TransactionEntity transactionEntity) {
        return modelMapper.map(transactionEntity, TransactionResponse.class);
    }
}
