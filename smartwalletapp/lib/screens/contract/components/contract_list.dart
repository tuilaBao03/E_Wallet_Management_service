import 'package:flutter/material.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/response/contract/get_contract_response.dart';
import 'package:smartwalletapp/screens/contract/components/detail_contract.dart';

class ContractList extends StatefulWidget {
  final String title;
  final List<GetContractResponse> contracts;
  final bool isContractScreent;
  final String token;
  final int page;

  const ContractList({
    super.key,
    required this.title,
    required this.contracts,
    required this.isContractScreent,
    required this.token,
    required this.page,
  });

  @override
  _ContractListState createState() => _ContractListState();
}

class _ContractListState extends State<ContractList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.5,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tiêu đề + nút thêm hợp đồng
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context).translate(widget.title),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.amber),
                  onPressed: () => _showContractAddDialog(context, widget.token),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            widget.contracts.isEmpty
                ? Center(
                    child: Text(
                      AppLocalizations.of(context).translate("There is no matching information"),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                : _buildContractList(widget.contracts),
          ],
        ),
      ),
    );
  }

  // Hiển thị danh sách hợp đồng dạng cây
  Widget _buildContractList(List<GetContractResponse> contracts) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: contracts.length,
      itemBuilder: (context, index) {
        return _buildContractTile(contracts[index]);
      },
    );
  }

  // Hiển thị mỗi hợp đồng
  Widget _buildContractTile(GetContractResponse contract) {
    return ExpansionTile(
      title: Row(
        children: [
          Expanded(child: Text(contract.contractName ?? "Unknown")),
          IconButton(
            onPressed: () => _showContractDetailDialog(context, contract),
            icon: const Icon(Icons.info_outline, color: Colors.green),
          ),
          IconButton(
            onPressed: () {
              // Thêm logic chỉnh sửa hợp đồng
            },
            icon: const Icon(Icons.edit, color: Colors.blue),
          ),
        ],
      ),
      children: contract.contracts.isNotEmpty
          ? contract.contracts.map((subContract) => _buildContractTile(subContract)).toList()
          : [const Padding(padding: EdgeInsets.all(8.0), child: Text("No sub-contracts available"))],
    );
  }

  // Dialog hiển thị chi tiết hợp đồng
  void _showContractDetailDialog(BuildContext context, GetContractResponse contract) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: ContractDetailScreen(contractInfo: contract),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Icon(Icons.cancel, color: Colors.red),
            ),
          ],
        );
      },
    );
  }

  // Dialog thêm hợp đồng
  void _showContractAddDialog(BuildContext context, String token) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: const Text("Form thêm hợp đồng sẽ đặt ở đây"), // Thay bằng form thêm hợp đồng thực tế
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Icon(Icons.cancel, color: Colors.red),
            ),
          ],
        );
      },
    );
  }
}
