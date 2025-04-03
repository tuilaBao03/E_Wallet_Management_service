import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/bloc/Contract/contract_bloc.dart';
import 'package:smartwalletapp/bloc/Contract/contract_event.dart';
import 'package:smartwalletapp/bloc/Contract/contract_state.dart';
import 'package:smartwalletapp/constants.dart';
import 'package:smartwalletapp/response/contract/get_contract_response.dart';
import 'package:smartwalletapp/screens/general/dialogAlert.dart';

class ContractDetailScreen extends StatefulWidget {
  final String contractNumber;
  final String token;

  const ContractDetailScreen({
    super.key,
    required this.contractNumber,
    required this.token,
  });

  @override
  State<ContractDetailScreen> createState() => _ContractDetailScreenState();
}

class _ContractDetailScreenState extends State<ContractDetailScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<ContractBloc>()
        .add(GetContractDetailEvent(widget.contractNumber, widget.token));
  }

  Widget _buildInfoField(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(label,
                style: const TextStyle(fontWeight: FontWeight.w600)),
          ),
          Expanded(
            flex: 3,
            child:
                Text(value ?? "-", style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildTwoColumnLayout(List<Widget> children) {
    List<Widget> leftColumn = [];
    List<Widget> rightColumn = [];

    for (int i = 0; i < children.length; i++) {
      if (i.isEven) {
        leftColumn.add(children[i]);
      } else {
        rightColumn.add(children[i]);
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Column(children: leftColumn)),
        const SizedBox(width: 20),
        Expanded(child: Column(children: rightColumn)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContractBloc, ContractState>(builder: (context, state) {
      if (state is ContractLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is GetDetailContractState) {
        GetContractResponse contractInfo = state.contract;
        return Scaffold(
            appBar: AppBar(
              title: Text(
                  AppLocalizations.of(context).translate("Detail Contract")),
              actions: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () => {

                          _showSetStateDialog(context, "Set state card contract", Icons.lock, Colors.lightGreenAccent, 
                          (){context.read<ContractBloc>().add(SetStatusEvent(
                                  widget.token, widget.contractNumber));}
                          )
                              
                            },
                        icon: Icon(Icons.lock,color: contractInfo.status=="N"? Colors.red:Colors.green,)),
                    IconButton(
                        onPressed: () => {
                          _showSetStateDialog(context, "Activate card contract", Icons.local_activity_sharp, Colors.lightGreenAccent, 
                          (){context.read<ContractBloc>().add(ActivateEvent(
                                  widget.token, widget.contractNumber));}
                          )
                              
                            },
                        icon: Icon(Icons.local_activity,color: contractInfo.status=="N"? Colors.red:Colors.green,)),
                  ],
                )
              ],
              automaticallyImplyLeading: false,
            ),
            body: Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Chi tiết hợp đồng",
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 16),
                    _buildTwoColumnLayout([
                      _buildInfoField("Mã hợp đồng", contractInfo.id),
                      _buildInfoField(
                          "Số hợp đồng", contractInfo.contractNumber),
                      _buildInfoField("Số hợp đồng an toàn",
                          contractInfo.safeContractNumber),
                      _buildInfoField(
                          "Tên hợp đồng", contractInfo.contractName),
                      _buildInfoField("Trạng thái", contractInfo.status),
                      _buildInfoField("Mã trạng thái", contractInfo.statusCode),
                      _buildInfoField(
                          "Loại hợp đồng", contractInfo.contractCategory),
                      _buildInfoField(
                          "Phân loại hợp đồng", contractInfo.contractSubtype),
                    ]),
                    const Divider(height: 32),
                    _buildTwoColumnLayout([
                      _buildInfoField("Khách hàng", contractInfo.client),
                      _buildInfoField(
                          "Tên đầy đủ", contractInfo.clientFullName),
                      _buildInfoField(
                          "Danh mục khách hàng", contractInfo.clientCategory),
                      _buildInfoField(
                          "Loại khách hàng", contractInfo.clientType),
                      _buildInfoField("Số CBS", contractInfo.cbsNumber),
                    ]),
                    const Divider(height: 32),
                    _buildTwoColumnLayout([
                      _buildInfoField(
                          "Sản phẩm chính", contractInfo.mainProductCorrected),
                      _buildInfoField(
                          "Mã sản phẩm chính", contractInfo.mainProductCode),
                      _buildInfoField("Sản phẩm", contractInfo.product),
                      _buildInfoField("Mã sản phẩm", contractInfo.productCode),
                      _buildInfoField(
                          "Danh mục sản phẩm", contractInfo.productCategory),
                      _buildInfoField("Danh mục sản phẩm sửa đổi",
                          contractInfo.redefinedProductCategory),
                      _buildInfoField("Loại báo cáo", contractInfo.reportType),
                    ]),
                    const Divider(height: 32),
                    _buildTwoColumnLayout([
                      _buildInfoField("Tiền tệ", contractInfo.currency),
                      _buildInfoField(
                          "Số dư khả dụng", contractInfo.available?.toString()),
                      _buildInfoField(
                          "Số dư hiện tại", contractInfo.balance?.toString()),
                      _buildInfoField("Hạn mức tín dụng",
                          contractInfo.creditLimit?.toString()),
                      _buildInfoField(
                          "Hạn mức bổ sung", contractInfo.addLimit?.toString()),
                      _buildInfoField(
                          "Tiền bị chặn", contractInfo.blocked?.toString()),
                      _buildInfoField(
                          "Tổng nợ đến hạn", contractInfo.totalDue?.toString()),
                      _buildInfoField(
                          "Nợ quá hạn", contractInfo.pastDue?.toString()),
                      _buildInfoField("Hạn mức bảo lãnh",
                          contractInfo.shadowAuthLimit?.toString()),
                    ]),
                    const Divider(height: 32),
                    _buildTwoColumnLayout([
                      _buildInfoField(
                          "Hợp đồng thanh toán", contractInfo.billingContract),
                      _buildInfoField(
                          "Hợp đồng cấp trên", contractInfo.topContract),
                      _buildInfoField(
                          "Cấp hợp đồng", contractInfo.contractLevel),
                      _buildInfoField(
                          "Kiểm tra sử dụng", contractInfo.checkUsage),
                    ]),
                    const Divider(height: 32),
                    _buildTwoColumnLayout([
                      _buildInfoField("Ngày mở", contractInfo.openDate),
                      _buildInfoField(
                          "Ngày sửa đổi", contractInfo.amendmentDate),
                      _buildInfoField(
                          "Ngày hóa đơn cuối", contractInfo.lastBillingDate),
                      _buildInfoField("Ngày hóa đơn tiếp theo",
                          contractInfo.nextBillingDate),
                      _buildInfoField(
                          "Ngày hoạt động cuối", contractInfo.lastActivityDate),
                      _buildInfoField("Ngày áp dụng cuối",
                          contractInfo.lastApplicationDate),
                      _buildInfoField("Nhân viên áp dụng cuối",
                          contractInfo.lastApplicationOfficer),
                      _buildInfoField("Trạng thái áp dụng cuối",
                          contractInfo.lastApplicationStatus),
                      _buildInfoField("Sẵn sàng", contractInfo.ready),
                      _buildInfoField("Số ngày nợ quá hạn",
                          contractInfo.pastDueDays?.toString()),
                    ]),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ));
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    }, listener: (context, state) {
      if (state is ContractEditOrActivateErrorState) {
        InputDialog.showError(
          context,
          title: 'Error',
          content: state.mess,
          onPressHidden1: () {
              context
        .read<ContractBloc>()
        .add(GetContractDetailEvent(widget.contractNumber, widget.token));
            },
        );
      }
      if (state is ContractEditOrActivateSuccessState){
        InputDialog.showSuccess(
          context,
          title: 'Success',
          content: state.mess,
          onPressHidden1: () {
              context
        .read<ContractBloc>()
        .add(GetContractDetailEvent(widget.contractNumber, widget.token));
            },
        );

      }
    });
  }

  void _showSetStateDialog(BuildContext context, String text, IconData icon, Color color, VoidCallback onpress) { 
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
          width: MediaQuery.of(context).size.width / 5, // Thay Get.width nếu không dùng GetX
          child: Column(
            mainAxisSize: MainAxisSize.min, // Để căn chỉnh kích thước cột hợp lý
            children: [
              Icon(icon, color: color, size: 40), // Sửa lỗi IconData
              const SizedBox(height: 10),
              Text(AppLocalizations.of(context).translate(text),style: TextStyle(color: Colors.white),) // Thêm khoảng cách nếu cần
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              onpress(); // Gọi hàm khi nhấn
              Navigator.of(context).pop(); // Đóng dialog
            },
            child: const Icon(Icons.check, color: Colors.green), // Sửa Icons.Ok (sai cú pháp)
          ),
        ],
      );
    },
  );
}

}
