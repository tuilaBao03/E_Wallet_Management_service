class CreateContractResponse {
    final String createdContract;
    final String contractNumber;
    final String applicationNumber;
    final int retCode;
    final String retMsg;
    final String resultInfo;
    CreateContractResponse({ required this.createdContract, required this.contractNumber, required this.applicationNumber, required this.retCode, required this.retMsg, required this.resultInfo});
    factory CreateContractResponse.fromJson(Map<String, dynamic> json) {
        return CreateContractResponse(
            createdContract: json['createdContract'] ?? '', 
            contractNumber: json['contractNumber'] ?? '', 
            applicationNumber: json['applicationNumber'] ?? '', 
            retCode: json['retCode'] ?? 123456, 
            retMsg: json['retMsg'] ?? '', 
            resultInfo: json['resultInfo'] ?? '', 
        );
    }
      @override
  String toString() {
    return 'CreateContractResponse {\n'
        '  createdContract: $createdContract,\n'
        '  contractNumber: $contractNumber,\n'
        '  applicationNumber: $applicationNumber,\n'
        '  retCode: $retCode,\n'
        '  retMsg: $retMsg,\n'
        '  resultInfo: $resultInfo\n'
        '}';
  }
}