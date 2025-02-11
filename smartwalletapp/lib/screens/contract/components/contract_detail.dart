// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/models/contract.dart';

import '../../../../constants.dart';

class ContractDetail extends StatefulWidget {
  final String title;
  final Contract object;

  const ContractDetail({
    super.key,
    required this.object,
    required this.title,
  });

  @override
  State<ContractDetail> createState() => _ContractDetailState();
}

class _ContractDetailState extends State<ContractDetail> {
  late bool _contractStatus; // Biến để lưu trạng thái hợp đồng

  @override
  void initState() {
    super.initState();
    _contractStatus = widget.object.status; // Gán trạng thái ban đầu từ hợp đồng
  }

  void _toggleContractStatus() {
    setState(() {
      _contractStatus = !_contractStatus;
    });

    // Thực hiện hành động khóa/mở hợp đồng tại đây (nếu cần lưu vào backend)
    print("Hợp đồng ${_contractStatus ? "được mở" : "đã khóa"}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tiêu đề
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context).translate(widget.title),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ElevatedButton(
                onPressed: _toggleContractStatus,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _contractStatus ? Colors.red : Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: Icon(_contractStatus ? Icons.lock : Icons.face_unlock_outlined),
              ),
              ],
            ),
            SizedBox(height: 16),

            // Chi tiết hợp đồng
            ObjectDetailInfor(contract: widget.object, status: _contractStatus),

            SizedBox(height: 16),

            // Button khóa/mở hợp đồng
          
          ],
        ),
      ),
    );
  }
}

// Hiển thị thông tin hợp đồng
class ObjectDetailInfor extends StatefulWidget {
  final Contract contract;
  final bool status; // Nhận trạng thái hợp đồng từ `ContractDetail`

  const ObjectDetailInfor({super.key, required this.contract, required this.status});

  @override
  State<ObjectDetailInfor> createState() => _ObjectDetailInforState();
}

class _ObjectDetailInforState extends State<ObjectDetailInfor> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Table(
          border: TableBorder.all(color: Theme.of(context).colorScheme.onPrimary),
          columnWidths: const {
            0: FlexColumnWidth(2), // Cột 1 rộng hơn
            1: FlexColumnWidth(3), // Cột 2 rộng hơn để chứa dữ liệu
          },
          children: [

            _buildTableRow('Contract ID', widget.contract.contractID.toString()),
            _buildTableRow('status', widget.contract.status.toString()),
            _buildTableRow('note', widget.contract.note.toString()),
            _buildTableRow('startD', widget.contract.createdDate.toString()),
            _buildTableRow('endD', widget.contract.updatedDate.toString()),
            _buildTableRow('ContractImageUrl', widget.contract.url)
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String field, String value) {
    return TableRow(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppLocalizations.of(context).translate(field),
            style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(value, style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimary)),
        ),
      ],
    );
  }
}
