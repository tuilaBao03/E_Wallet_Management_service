package com.backend.smartwalletapp.dto.response.Card;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@RequiredArgsConstructor
@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CreateCardReponse {

    String createdCard;
    String cardNumber;
    String expiryDate;
    String SequenceNumber;
    int retCode;
    String retMsg;
    String resultInfo;
}

