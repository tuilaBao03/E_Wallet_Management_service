
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/models/transaction.dart';

import '../../constants.dart';
import '../../models/user.dart';
import '../../responsive.dart';
import '../general/header.dart';

import '../card/components/my_card.dart';
import 'components/table_object.dart';
import 'components/assets_details.dart';

class DashboardScreen extends StatelessWidget {
  final bool isAuth;
  final User user;
  DashboardScreen({super.key,
   required this.isAuth, required this.user,
});
final HashSet<String> objectColumnName = HashSet.from([
  "File Name",
  "Date",
  "Budget",
  "Type Money",
  "Type"
]);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(title: AppLocalizations.of(context).translate("Dashboard"),user: user, isAuth: isAuth,),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      MyCard(),
                      SizedBox(height: defaultPadding),
                      TableObject(object: demoTransactionList, objectColumnName: objectColumnName, title: 'RecentTrans',),
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
