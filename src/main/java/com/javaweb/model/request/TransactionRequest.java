package com.javaweb.model.request;

import com.javaweb.model.dto.AbstractDTO;

public class TransactionRequest extends AbstractDTO {
    private String note;

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
