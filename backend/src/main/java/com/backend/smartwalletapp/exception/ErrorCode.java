package com.backend.smartwalletapp.exception;

public enum ErrorCode {
    // System errors
    ERROR_NOT_FOUND(0001,"error special"),
    // User errors
    USER_NOT_FOUND(1001, "User not found"),
    USER_ALREADY_EXISTS(1002, "User already exists"),
    PASSWORD_NOT_MATCH(1003, "Password not match"),
    PASSWORD_NOT_VALID(1004, "Password not valid"),
    INVALID_CREDENTIALS(1005, "Invalid credentials"),
    UNAUTHORIZED(1006, "Unauthorized"),
    INVALID_REQUEST(1007, "Invalid request"),
    INTERNAL_SERVER_ERROR(1008, "Internal server error"),

    // cardholder
    GET_CARDHOLDER_FAILE(6000,"get cardholder faile"),
    CARDHOLDER_NOT_FOUND(6001, "cardholder not found"),
    CARDHOLDER_NOT_EXISTS(6002, "cardholder not exists"),

    // contract 
    CONTRACT_NOT_FOUND(7001, "cardholder not found"),
    CONTRACT_NOT_EXISTS(7002, "cardholder not exists"),
    LOCK_UNLOCK_FAILE(7003,"lock or unlock failed"),
    CREATE_CONTRACT_FAILE(7004,"update contract failed"),
    GET_CONTRACT_FAILE(7005,"get contract failed"),
    UPDATE_CONTRACT_FAILE(7004,"update contract failed"),

    // card 
    GET_CARD_FAILLE(8000, "get card fail"),
    LOCK_UNLOCK_CARD_FAILE(8001, "lock or unlock card faile");

    ErrorCode(int code, String message) {
        this.code = code;
        this.message = message;
    }
    private final int code;
    private final String message;

    public int getCode() {
        return code;
    }
    public String getMessage() {
        return message;
    }
}
