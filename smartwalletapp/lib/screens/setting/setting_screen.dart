
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/user.dart';
import '../../responsive.dart';
import '../general/header.dart';
import '../card/components/my_card.dart';
import '../dashboard/components/assets_details.dart';


class SettingScreen extends StatelessWidget {
  final bool isAuth;
  SettingScreen({super.key,
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
    email: '', userId: '',
    createdDate: DateTime.now(),
    updateDate: DateTime.now(),
    status: true, );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(title: "Setting",user: user, isAuth: isAuth,),
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
                      // RecentObject(),
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
