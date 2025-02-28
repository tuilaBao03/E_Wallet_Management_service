package com.backend.smartwalletapp.service;
import java.util.List;
import org.springframework.stereotype.Service;
import com.backend.smartwalletapp.Mapper.CardHolderMapper;
import com.backend.smartwalletapp.client.requests.CardHolders.CreateCardHolderSoapRequest;
import com.backend.smartwalletapp.client.requests.CardHolders.LockOrUnlockCardHolderSoapRequest;
import com.backend.smartwalletapp.client.responses.CardHolders.CreateCardHolderSoapResponse;
import com.backend.smartwalletapp.client.responses.CardHolders.GetCardHolderBySearchResponse;
import com.backend.smartwalletapp.client.responses.CardHolders.LockOrUnlockCardHolderSoapResponse;
import com.backend.smartwalletapp.client.service.CardHolderSoapService;
import com.backend.smartwalletapp.dto.request.CardHolder.CardHolderCreatedRequest;
import com.backend.smartwalletapp.dto.request.CardHolder.LockUnlockStatusCardHolderRequest;
import com.backend.smartwalletapp.dto.response.CardHolder.CardHolderResponse;
import com.backend.smartwalletapp.exception.AppException;
import com.backend.smartwalletapp.exception.ErrorCode;
import com.backend.smartwalletapp.model.CardHolder;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
@Service
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class CardHolderService {
    CardHolderMapper cardHolderMapper;
    CardHolderSoapService soapClient;

    public CardHolder createCardHolder(CardHolderCreatedRequest request){
        try{
            CreateCardHolderSoapRequest cardHolderSoapRequest = cardHolderMapper.toSoapRequest(request);
            CreateCardHolderSoapResponse createCardHolderSoapResponse = soapClient.CreateCardHolder(cardHolderSoapRequest);
            return createCardHolderSoapResponse.getCardHolder();
        }
        catch( Exception e){
            e.printStackTrace();
            throw new AppException(ErrorCode.INTERNAL_SERVER_ERROR);
        }
    }
    public CardHolder updateStatusCardHolder(String id,LockUnlockStatusCardHolderRequest request){
        try{
            LockOrUnlockCardHolderSoapRequest lockOrUnlockCardHolderSoapRequest
            = cardHolderMapper.toStatusCardHolderSoapRequest(request);
            LockOrUnlockCardHolderSoapResponse lockOrUnlockCardHolderSoapResponse 
            = soapClient.UpdateStatusCardHolder(lockOrUnlockCardHolderSoapRequest, id);
            return lockOrUnlockCardHolderSoapResponse.getCardHolder();
        }
        catch(Exception e){
            e.printStackTrace();
            throw new AppException(ErrorCode.INTERNAL_SERVER_ERROR);
        }
    }
    public CardHolder updateCardHolder(String id, CardHolderCreatedRequest request){
        try {
            CreateCardHolderSoapRequest cardHolderSoapRequest = cardHolderMapper.toSoapRequest(request);
            CreateCardHolderSoapResponse createCardHolderSoapResponse = soapClient.UpdateCardHolder(cardHolderSoapRequest, id);
            return createCardHolderSoapResponse.getCardHolder();
        } catch (Exception e) {
            e.printStackTrace();
            throw new AppException(ErrorCode.INTERNAL_SERVER_ERROR);
        }
        
    }
    public CardHolderResponse getCardHolders(String name, int page, int size) {
        // Gửi request đến SOAP API với tham số tìm kiếm
        GetCardHolderBySearchResponse soapResponse = soapClient.getCardHolderFromSoap(name, page);
        // Lấy danh sách CardHolder từ SOAP response
        List<CardHolder> cardHolders = soapResponse.getCardHolder();
        int Page = soapResponse.getPage();
        int pageAmount = soapResponse.getPageAmount();
        // Chuyển danh sách sang Page<CardHolder> 
        CardHolderResponse cardHolderResponse = new CardHolderResponse(Page, pageAmount, cardHolders);
        return cardHolderResponse;
    }
}
