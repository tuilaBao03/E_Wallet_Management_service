// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:smartwalletapp/bloc/MainApp/MainAppEvent.dart';

import '../../../app/locallization/app_localizations.dart';
import '../../../bloc/MainApp/MainAppBloc.dart';
import '../../../constants.dart';
import '../../../repository/DashboardRepository.dart';
import 'line_chart.dart';

class Diagram extends StatefulWidget {
  final List<Card_Time> list_card_time;
  final String ByObject;

  const Diagram({super.key, required this.list_card_time, required this.ByObject});

  @override
  State<Diagram> createState() => _DiagramState();
}

class _DiagramState extends State<Diagram> {
  late DateTime startDate = DateTime.now();
  late DateTime endDate = DateTime.now();
  bool showDatePickerOptions = false; // Biến kiểm soát hiển thị bộ chọn ngày

  // Hàm chọn ngày
  Future<void> selectDate(BuildContext context, bool isStartDate) async {

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? startDate : endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
    context.read<MainAppBloc>().add(GiveCard_TimeListEvent(startDate, endDate));
  }
  @override
  void initState() {
    super.initState();
    context.read<MainAppBloc>().add(GiveCard_TimeListEvent(startDate, endDate));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).translate("Card amount was created by ${AppLocalizations.of(context).translate(widget.ByObject)}"),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Column(
                children: [
                  ElevatedButton.icon(
                    icon: Icon(Icons.date_range),
                    label: Text(DateFormat('dd/MM/yyyy').format(startDate),
                      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontSize: 11,)),
                    onPressed: () => selectDate(context, true),
                  ),
                  SizedBox(height: Get.height/100),
                  ElevatedButton.icon(
                    icon: Icon(Icons.date_range),
                    label: Text(DateFormat('dd/MM/yyyy').format(endDate),
                      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontSize: 11,)),
                    onPressed: () => selectDate(context, false),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: defaultPadding),
          // Hiển thị phần chọn ngày khi showDatePickerOptions = true
          LineChartSample(cardTimes: widget.list_card_time, xAxisTitle: 'X', yAxisTitle: 'Y',)
        ],
      ),
    );
  }
}
