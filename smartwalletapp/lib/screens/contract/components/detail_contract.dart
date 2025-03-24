import 'package:flutter/material.dart';
import 'package:smartwalletapp/constants.dart';
import 'package:smartwalletapp/response/contract/get_contract_response.dart';

class ContractDetailScreen extends StatelessWidget {
  final GetContractResponse contractInfo;

  const ContractDetailScreen({
    super.key,
    required this.contractInfo,
  });

  Widget _buildInfoField(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          ),
          Expanded(
            flex: 3,
            child: Text(value ?? "-", style: const TextStyle(color: Colors.black87)),
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
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Chi tiết hợp đồng", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),

            _buildTwoColumnLayout([
              _buildInfoField("Mã hợp đồng", contractInfo.id),
              _buildInfoField("Số hợp đồng", contractInfo.contractNumber),
              _buildInfoField("Số hợp đồng an toàn", contractInfo.safeContractNumber),
              _buildInfoField("Tên hợp đồng", contractInfo.contractName),
              _buildInfoField("Trạng thái", contractInfo.status),
              _buildInfoField("Mã trạng thái", contractInfo.statusCode),
              _buildInfoField("Loại hợp đồng", contractInfo.contractCategory),
              _buildInfoField("Phân loại hợp đồng", contractInfo.contractSubtype),
            ]),

            const Divider(height: 32),

            _buildTwoColumnLayout([
              _buildInfoField("Khách hàng", contractInfo.client),
              _buildInfoField("Tên đầy đủ", contractInfo.clientFullName),
              _buildInfoField("Danh mục khách hàng", contractInfo.clientCategory),
              _buildInfoField("Loại khách hàng", contractInfo.clientType),
              _buildInfoField("Số CBS", contractInfo.cbsNumber),
            ]),

            const Divider(height: 32),

            _buildTwoColumnLayout([
              _buildInfoField("Sản phẩm chính", contractInfo.mainProductCorrected),
              _buildInfoField("Mã sản phẩm chính", contractInfo.mainProductCode),
              _buildInfoField("Sản phẩm", contractInfo.product),
              _buildInfoField("Mã sản phẩm", contractInfo.productCode),
              _buildInfoField("Danh mục sản phẩm", contractInfo.productCategory),
              _buildInfoField("Danh mục sản phẩm sửa đổi", contractInfo.redefinedProductCategory),
              _buildInfoField("Loại báo cáo", contractInfo.reportType),
            ]),

            const Divider(height: 32),

            _buildTwoColumnLayout([
              _buildInfoField("Tiền tệ", contractInfo.currency),
              _buildInfoField("Số dư khả dụng", contractInfo.available?.toString()),
              _buildInfoField("Số dư hiện tại", contractInfo.balance?.toString()),
              _buildInfoField("Hạn mức tín dụng", contractInfo.creditLimit?.toString()),
              _buildInfoField("Hạn mức bổ sung", contractInfo.addLimit?.toString()),
              _buildInfoField("Tiền bị chặn", contractInfo.blocked?.toString()),
              _buildInfoField("Tổng nợ đến hạn", contractInfo.totalDue?.toString()),
              _buildInfoField("Nợ quá hạn", contractInfo.pastDue?.toString()),
              _buildInfoField("Hạn mức bảo lãnh", contractInfo.shadowAuthLimit?.toString()),
            ]),

            const Divider(height: 32),

            _buildTwoColumnLayout([
              _buildInfoField("Hợp đồng thanh toán", contractInfo.billingContract),
              _buildInfoField("Hợp đồng cấp trên", contractInfo.topContract),
              _buildInfoField("Cấp hợp đồng", contractInfo.contractLevel),
              _buildInfoField("Kiểm tra sử dụng", contractInfo.checkUsage),
            ]),

            const Divider(height: 32),

            _buildTwoColumnLayout([
              _buildInfoField("Ngày mở", contractInfo.openDate),
              _buildInfoField("Ngày sửa đổi", contractInfo.amendmentDate),
              _buildInfoField("Ngày hóa đơn cuối", contractInfo.lastBillingDate),
              _buildInfoField("Ngày hóa đơn tiếp theo", contractInfo.nextBillingDate),
              _buildInfoField("Ngày hoạt động cuối", contractInfo.lastActivityDate),
              _buildInfoField("Ngày áp dụng cuối", contractInfo.lastApplicationDate),
              _buildInfoField("Nhân viên áp dụng cuối", contractInfo.lastApplicationOfficer),
              _buildInfoField("Trạng thái áp dụng cuối", contractInfo.lastApplicationStatus),
              _buildInfoField("Sẵn sàng", contractInfo.ready),
              _buildInfoField("Số ngày nợ quá hạn", contractInfo.pastDueDays?.toString()),
            ]),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
