
// ignore_for_file: non_constant_identifier_names



import 'package:flutter/material.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';


import '../../constants.dart';

import '../../models/user.dart';
import '../../repository/DashboardRepository.dart';
import '../../responsive.dart';
import '../general/header.dart';


import 'components/assets_details.dart';
import 'components/diagram.dart';

class DashboardScreen extends StatefulWidget {
  final List<Card_Time> card_times;
  final bool isAuth;
  final User user;
  final Function(Locale) onLanguageChange;
  const DashboardScreen({

    super.key,
   required this.isAuth, required this.user, required this.onLanguageChange, required this.card_times,
});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(title: AppLocalizations.of(context).translate("Dashboard"),user: widget.user, isAuth: widget.isAuth, onLanguageChange: widget.onLanguageChange),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      Expanded(
                        flex:4,
                          child: Diagram(list_card_time: widget.card_times, ByObject: 'year',))
                      ,
                      SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) AssetsDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we don't want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: AssetsDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
