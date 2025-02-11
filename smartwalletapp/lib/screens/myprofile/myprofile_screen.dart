
// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names


import 'package:flutter/material.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/screens/customer/components/customer_detail.dart';


import '../../constants.dart';
import '../../models/user.dart';
import '../general/header.dart';


class MyprofileScreen extends StatefulWidget {

  final bool isAuth;
  final User user;
  const MyprofileScreen({super.key, required this.isAuth, required this.user});

  @override
  _MyprofileScreenState createState() => _MyprofileScreenState();
}

class _MyprofileScreenState extends State<MyprofileScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(title: AppLocalizations.of(context).translate("Customer"),
            user: widget.user,
            isAuth: widget.isAuth),
            SizedBox(height: defaultPadding),
            Row(

              children: [
                SizedBox(width: defaultPadding*2),
                Expanded(
              flex: 1,
              child: CustomerDetail(
              object: widget.user,
              isImage: true,
              title: 'My Profile',
              isActive: true,
              isUpdate: false,
            ),),
            SizedBox(width: defaultPadding*2),
            ],
            )
            
          ]
        ),
      ) 
    );
  }
}

