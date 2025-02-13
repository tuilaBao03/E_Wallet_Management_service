
// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:smartwalletapp/screens/main/components/classInitial.dart';
import '../../constants.dart';
import '../../models/user.dart';
import '../../responsive.dart';
import '../general/header.dart';
import '../card/components/my_card.dart';
import '../dashboard/components/assets_details.dart';


class SettingScreen extends StatelessWidget {
  final bool isAuth;
  final User user;
  SettingScreen({super.key,
    required this.isAuth,
    required this.user,
  });
  final User selecteduser = selectedUserInittial;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(title: "Setting",user: user, isAuth: isAuth, onLanguageChange: (Locale ) {  },),
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
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) AssetsDetails(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
