
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/user.dart';
import '../../responsive.dart';
import '../screens/dashboard/components/header.dart';
import '../screens/dashboard/components/my_fields.dart';
import '../screens/dashboard/components/recent_files.dart';
import '../screens/dashboard/components/storage_details.dart';



class TransactionScreen extends StatelessWidget {
  final bool isAuth;
  TransactionScreen({super.key,
    required this.isAuth,

  });

  final User user = User(
    username: "",
    password: "",
    phoneNumber: "",
    homeAddress: "",
    companyAddress: "",
    lastName: "",
    firstName: "",
    avatar: "",
    email: '', );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(title: "Transaction",user: user, isAuth: isAuth,),
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
                      RecentFiles(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) StorageDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we don't want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: StorageDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
