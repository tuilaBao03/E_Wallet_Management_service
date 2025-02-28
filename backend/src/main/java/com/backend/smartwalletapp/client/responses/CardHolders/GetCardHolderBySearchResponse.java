package com.backend.smartwalletapp.client.responses.CardHolders;
import java.util.List;

import com.backend.smartwalletapp.model.CardHolder;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@XmlRootElement(name = "GetCardHolderBySearchResponse")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class GetCardHolderBySearchResponse {
    @XmlElement(name = "CardHolder")
    private List<CardHolder> cardHolder;
    
    @XmlElement(name = "Page")  // Thêm nếu cần
    private int page;

    @XmlElement(name = "PageAmount")  // Thêm nếu cần
    private int pageAmount;
}

