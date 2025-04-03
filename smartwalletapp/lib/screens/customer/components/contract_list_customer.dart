// ignore_for_file: library_private_types_in_public_api, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/bloc/Contract/contract_bloc.dart';
import 'package:smartwalletapp/bloc/Contract/contract_event.dart';
import 'package:smartwalletapp/bloc/Contract/contract_state.dart';
import 'package:smartwalletapp/response/contract/get_contract_custom_response.dart';
import 'package:smartwalletapp/screens/contract/components/add_contract_card.dart';
import 'package:smartwalletapp/screens/contract/components/add_contract_issue.dart';
import 'package:smartwalletapp/screens/contract/components/add_contract_liab.dart';
import 'package:smartwalletapp/screens/contract/components/detail_contract.dart';
import 'package:smartwalletapp/screens/contract/components/edit_contract.dart';
import 'package:smartwalletapp/screens/general/dialogAlert.dart';

class ContractListByCustomer extends StatefulWidget {
  final String token;

  final String clientIdentifier;

  final VoidCallback onpress;

  const ContractListByCustomer({
    super.key,
    required this.token,
    required this.clientIdentifier, // Không bắt buộc truyền vào
    required this.onpress
  });

  @override
  _ContractListByCustomerState createState() => _ContractListByCustomerState();
}


class _ContractListByCustomerState extends State<ContractListByCustomer> {
  List<GetContractResponseCustom> contracts_fill = [];

  
    @override
  void initState() {
    super.initState();
    _fetchContracts();
  }

  @override
  void didUpdateWidget(covariant ContractListByCustomer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.clientIdentifier != widget.clientIdentifier) {
      _fetchContracts(); // Gọi lại API khi clientIdentifier thay đổi
    }
  }

  void _fetchContracts() {
    context.read<ContractBloc>().add(GetContractDetailByClientNumberEvent(widget.clientIdentifier, widget.token));
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContractBloc,ContractState>(
      builder: (context,state){
        if(state is ContractLoadingState){
          return Center(child: CircularProgressIndicator(),);
        }
        else if (state is ContractLoadedState){
          contracts_fill = state.libContracts;
          return Container(
            height: MediaQuery.of(context).size.height/1.2,
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
                        AppLocalizations.of(context).translate("Contract List"),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      IconButton(
                        icon: const Icon(Icons.add, color: Colors.amber),
                        onPressed: () => _showContractAddLiabDialog(context, widget.token,widget.clientIdentifier),
                      ),
                      Spacer(),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.red),
                        onPressed: widget.onpress
                      )
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  contracts_fill.isEmpty
                      ? Center(
                          child: Text(
                            AppLocalizations.of(context).translate("There is no matching information"),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        )
                      : _buildContractList(contracts_fill),
                ],
              ),
            ),
          );

        }
        return Center(child: CircularProgressIndicator(),);
      },
      listener: (context,state){
        if(state is ContractErrorState){
          InputDialog.showError(
            context,
            title: 'Error',
            content: state.mess,
            

          );
        }
        else if(state is ContractSuccessState){
          InputDialog.showSuccess(
            context,
            title: 'Success',
            content: state.mess,
            onPressHidden1: () {
              context.read<ContractBloc>().add(GetContractDetailByClientNumberEvent(widget.clientIdentifier,widget.token));
            },
          );
        }
      });
  }

  // Hiển thị danh sách hợp đồng dạng cây
  Widget _buildContractList(List<GetContractResponseCustom> contracts) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: contracts.length,
    itemBuilder: (context, index) {
      return _buildContractTile(contracts[index], 0); // Cấp gốc (depth = 0)
    },
  );
}

  // Hiển thị mỗi hợp đồng
  Widget _buildContractTile(GetContractResponseCustom contract, int depth) {

    // Xác định màu viền theo cấp
    Color borderColor;
    switch (depth) {
      case 0:
        borderColor = Colors.purple; // Cấp 1
        break;
      case 1:
        borderColor = Colors.amber; // Cấp 2
        break;
      default:
        borderColor = Colors.green; // Cấp 3 trở đi
    }

    return Padding(
      padding: EdgeInsets.only(left: depth * 8), // Thụt vào theo cấp
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            backgroundColor: Colors.transparent,
            collapsedBackgroundColor: Colors.transparent,
            title: Text(contract.contractNumber),
            subtitle: Text("Name : ${contract.contractName}" ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => _showContractDetailDialog(context, contract.contractNumber, widget.token),
                  icon: Icon(Icons.info_outline, color: Colors.white,),
                ),
                IconButton(
                  onPressed: () {
                    _showEditDialog(context,widget.token,contract);
                  },
                  icon: Icon(Icons.edit,color: Colors.white,),
                ),
                if (depth < 2) // Chỉ hiện nút Add cho cấp 1 và 2
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.amber),
                    onPressed: () => depth ==0 ? _showContractAddIssueDialog(context, widget.token,widget.clientIdentifier,contract.contractNumber):_showContractAddCardDialog(context, widget.token,contract.contractNumber),
                  ),
              ],
            ),
            children: contract.contracts.isNotEmpty 
              ? contract.contracts.map((subContract) => _buildContractTile(subContract, depth + 1)).toList()
              : [

              ],
          ),
        ),
      ),
    );
  }

  // Dialog hiển thị chi tiết hợp đồng
  void _showContractDetailDialog(BuildContext context, String cardNumber, String token ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: Get.width/1.1,
            child: ContractDetailScreen(contractNumber: cardNumber, token: token)),
          actions: [
            TextButton(
              onPressed: () => {
             
              context.read<ContractBloc>().add(GetContractDetailByClientNumberEvent(widget.clientIdentifier,widget.token)),
              Navigator.of(context).pop(),
              },
              child: const Icon(Icons.cancel, color: Colors.red),
            ),
          ],
        );
      },
    );
  }

  // Dialog thêm hợp đồng
  void _showContractAddLiabDialog(BuildContext context, String token,String clientIdentifier ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: Get.width/1.1,
            child: CreateLiabContractFormScreen(token: token, clientIdentifier: clientIdentifier), // Thay bằng form thêm hợp đồng thực tế
          ),
          actions: [
            TextButton(
              onPressed: () => {
                context.read<ContractBloc>().add(GetContractDetailByClientNumberEvent(widget.clientIdentifier,widget.token)),
                Navigator.of(context).pop(),
              },
              child: const Icon(Icons.cancel, color: Colors.red),
            ),
          ],
        );
      },
    );
  }
  void _showContractAddIssueDialog(BuildContext context, String token,String clientIdentifier,String liabContractIdentifier ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: Get.width/1.1,
            height: Get.height,
            child: AddIssueContractFormScreen(token: token, title: "CreateIssue", liabContractIdentifier: liabContractIdentifier, clientIdentifier: clientIdentifier,), // Thay bằng form thêm hợp đồng thực tế
          ),
          actions: [
            TextButton(
              onPressed: () => {
                context.read<ContractBloc>().add(GetContractDetailByClientNumberEvent(widget.clientIdentifier,widget.token)),
                Navigator.of(context).pop(),
              },
              child: const Icon(Icons.cancel, color: Colors.red),
            ),
          ],
        );
      },
    );
  }
  void _showContractAddCardDialog(BuildContext context, String token, String contractIdentifier ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: Get.width/1.1,
            child: CreateCardContractFormScreen(token: token, title: "CreateCard", contractIdentifier: contractIdentifier,), // Thay bằng form thêm hợp đồng thực tế
          ),
          actions: [
            TextButton(
              onPressed: () => {
                context.read<ContractBloc>().add(GetContractDetailByClientNumberEvent(widget.clientIdentifier,widget.token)),
                Navigator.of(context).pop(),
              },
              child: const Icon(Icons.cancel, color: Colors.red),
            ),
          ],
        );
      },
    );
  }
  void _showEditDialog(BuildContext context, String token, GetContractResponseCustom contract ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: Get.width/1.1,
            child: EditContractForm(token: token, contract: contract), // Thay bằng form thêm hợp đồng thực tế
          ),
          actions: [
            TextButton(
              onPressed: () => {
                context.read<ContractBloc>().add(GetContractDetailByClientNumberEvent(widget.clientIdentifier,widget.token)),
                Navigator.of(context).pop(),
              },
              child: const Icon(Icons.cancel, color: Colors.red),
            ),
          ],
        );
      },
    );
  }




}
