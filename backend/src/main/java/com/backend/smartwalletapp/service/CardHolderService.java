package com.backend.smartwalletapp.service;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Service;
import com.backend.smartwalletapp.client.requests.CardHolders.create.CreateClientV4Body;
import com.backend.smartwalletapp.client.requests.CardHolders.edit.EditClientV6;
import com.backend.smartwalletapp.client.responses.CardHolders.createRes.CreateClientV4Response;
import com.backend.smartwalletapp.client.responses.CardHolders.createRes.CreateClientV4Result;
import com.backend.smartwalletapp.client.service.CardHolderSoapService;
import com.backend.smartwalletapp.dto.request.CardHolder.CreateCardHolder.CardHolderCreatedRequest;
import com.backend.smartwalletapp.dto.response.ApiResponse;
import com.backend.smartwalletapp.dto.response.CardHolder.CreateCardHolderResponse;
import com.backend.smartwalletapp.dto.response.CardHolder.GetCardHolder.CardHolderByPageAndSearch;
import com.backend.smartwalletapp.dto.response.CardHolder.GetCardHolder.GetCardHolderResponse;
import com.backend.smartwalletapp.exception.AppException;
import com.backend.smartwalletapp.exception.ErrorCode;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@Service
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class CardHolderService {

    CardHolderSoapService soapClient;

    public DataSource oracleDataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("oracle.jdbc.OracleDriver");
        dataSource.setUrl("jdbc:oracle:thin:@10.145.48.96:1521/way4db");
        dataSource.setUsername("int");
        dataSource.setPassword("way4");
        return dataSource;
    }

        // Mở kết nối
        public Connection openConnection() throws SQLException {
            return oracleDataSource().getConnection();
        }
    
        // Đóng kết nối
        public void closeResources(Connection connection, Statement statement, ResultSet resultSet) {
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    
        // Hàm test query
        @SuppressWarnings("null")
        public CardHolderByPageAndSearch getCardHolders(int page, String search, int limit) {
            List<GetCardHolderResponse> cardholders = new ArrayList<>();
            Connection connection = null;
            Statement statement = null;
            ResultSet countResultSet = null;
            ResultSet dataResultSet = null;
            int offset = limit * (page - 1);
            int totalRecords = 0;
            int totalPages = 0;
        
            try {
                connection = openConnection();
                statement = connection.createStatement();
        
                // Câu lệnh lấy tổng số bản ghi
                String countQuery = "SELECT COUNT(*) AS total FROM CARDHOLDEROFHAGIABAO WHERE LOWER(Short_Name) LIKE '%" + search.toLowerCase() + "%' ORDER BY id DESC";
                System.out.println(countQuery); // Debug SQL
                countResultSet = statement.executeQuery(countQuery);
        
                if (countResultSet.next()) {
                    totalRecords = countResultSet.getInt("total");
                    totalPages = (int) Math.ceil((double) totalRecords / limit);
                }
        
                // Câu lệnh lấy dữ liệu phân trang
                String dataQuery = "SELECT * FROM CARDHOLDEROFHAGIABAO WHERE LOWER(SHORT_NAME) LIKE '%" + search.toLowerCase() + "%' " +
                                   "ORDER BY ID OFFSET " + offset + " ROWS FETCH NEXT " + limit + " ROWS ONLY";
                System.out.println(dataQuery);
                try {
                    dataResultSet = statement.executeQuery(dataQuery);
                } catch (SQLException e) {
                    System.err.println("dataResultSet Error: " + e.getMessage());
                    e.printStackTrace();
                }
                while (dataResultSet.next()) {
                    GetCardHolderResponse cardholder = new GetCardHolderResponse();
                    cardholder.setId(dataResultSet.getInt("ID"));
                    cardholder.setBranch(dataResultSet.getString("BRANCH"));
                    cardholder.setShortName(dataResultSet.getString("SHORT_NAME"));
                    cardholder.setFirstName(dataResultSet.getString("FIRST_NAM"));
                    cardholder.setLastName(dataResultSet.getString("LAST_NAM"));
                    cardholder.setGender(dataResultSet.getString("GENDER"));
                    cardholder.setClientNumber(dataResultSet.getString("CLIENT_NUMBER"));
                    cardholder.setRegNumber(dataResultSet.getString("REG_NUMBER"));
                    cardholder.setItn(dataResultSet.getString("ITN"));
                    cardholder.setSocialNumber(dataResultSet.getString("SOCIAL_NUMBER"));
                    cardholder.setPhone(dataResultSet.getString("PHONE"));
                    cardholder.setEmail(dataResultSet.getString("E_MAIL"));
                    cardholders.add(cardholder);
                }
        
            } catch (SQLException e) {
                e.printStackTrace();
                System.err.println("dataResultSet2 Error: " + e.getMessage());
            } finally {
                closeResources(connection, statement, countResultSet);
                closeResources(null, statement, dataResultSet);
            }
        
            return CardHolderByPageAndSearch.builder()
                .page(page)
                .cardholders(cardholders)
                .pageTotal(totalPages)
                .build();
        }
        
        
    public CreateClientV4Result createCardHolder(CreateClientV4Body request) {
        try {
            System.err.println("==================================");
            // 1. Map dữ liệu từ request sang Body SOAP

    
    
            // 4. Gửi request qua soapClient
            CreateClientV4Response createCardHolderSoapResponse = soapClient.createCardHolder(request);

            CreateClientV4Result result = createCardHolderSoapResponse.getCreateClientV4Result();

            System.err.println(result);
    
            // 5. Trả về kết quả cuối cùng
            return result;
    
        } catch (Exception e) {
            e.printStackTrace();
            throw new AppException(ErrorCode.INTERNAL_SERVER_ERROR);
        }
    }

    // public ApiResponse editCardholder(EditClientV6 request){
    //     try {
    //         System.err.println("==================================");
    //         // 1. Map dữ liệu từ request sang Body SOAP
    //         // 4. Gửi request qua soapClient
    //         ApiResponse response = soapClient.editCardHolder(request);

    //         System.err.println(response);
    
    //         // 5. Trả về kết quả cuối cùng
    //         return response;
    
    //     } catch (Exception e) {
    //         e.printStackTrace();
    //         throw new AppException(ErrorCode.INTERNAL_SERVER_ERROR);
    //     }
    // }
    
}
