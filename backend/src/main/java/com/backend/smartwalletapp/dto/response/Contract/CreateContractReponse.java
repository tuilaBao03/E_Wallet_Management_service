package com.backend.smartwalletapp.dto.response.Contract;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@RequiredArgsConstructor
@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CreateContractReponse {

    String createdContract;
    String contractNumber;
    String applicationNumber;
    int retCode;
    String retMsg;
    String resultInfo;
}

