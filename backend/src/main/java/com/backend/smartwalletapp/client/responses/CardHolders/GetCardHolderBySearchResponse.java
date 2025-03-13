package com.backend.smartwalletapp.client.responses.CardHolders;
import java.util.List;

import com.backend.smartwalletapp.model.CardHolder;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.FieldDefaults;


@XmlRootElement(name = "GetCardHolderBySearchResponse")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@XmlAccessorType(XmlAccessType.FIELD)
@FieldDefaults(level = AccessLevel.PRIVATE)
public class GetCardHolderBySearchResponse {
    @XmlElement(name = "CardHolder")
    private List<CardHolder> cardHolder;
    
    @XmlElement(name = "Page")  // Thêm nếu cần
    private int page;

    @XmlElement(name = "PageAmount")  // Thêm nếu cần
    private int pageAmount;
}

