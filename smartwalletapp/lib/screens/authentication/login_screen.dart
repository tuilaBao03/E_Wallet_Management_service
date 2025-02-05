// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/bloc/Auth/AuthEvent.dart';
import 'package:smartwalletapp/bloc/Auth/AuthState.dart';
import 'package:smartwalletapp/models/user.dart';

import '../../bloc/Auth/AuthBloc.dart';
import '../../constants.dart';
import '../dashboard/components/header.dart';
class LoginScreen extends StatefulWidget {
  final bool isAuth;

  LoginScreen({super.key,
    required this.isAuth,
});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  late User user = User(username: "", password: "", phoneNumber: "", homeAddress: "", companyAddress: "", lastName: "", firstName: "", avatar: "");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc,AuthState>(
      builder: (context,state){
        if(state is AuthSuccess){
          user = state.user;
        }
        return SafeArea(
          child: SingleChildScrollView(
            primary: false,
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                Header(title: "Login",user: user, isAuth: widget.isAuth,),
                SizedBox(height: defaultPadding),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: Get.height/1.1,
                        padding: EdgeInsets.all(defaultPadding),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      height: Get.height/1.2,
                                      width: Get.width/3,
                                      padding: EdgeInsets.all(defaultPadding),
                                      decoration: BoxDecoration(
                                        color: secondaryColor,
                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: CircleAvatar(
                                              radius: Get.width / 20, // Đặt kích thước avatar
                                              backgroundColor: Colors.blue, // Màu nền
                                              child: Icon(
                                                Icons.person, // Icon hiển thị bên trong
                                                size: Get.width / 15, // Kích thước icon
                                                color: Colors.white, // Màu icon
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: Get.width/30,),
                                          Column(
                                            children: [
                                              TextField(
                                                controller: usernameController,
                                                decoration: InputDecoration(
                                                  labelText: AppLocalizations.of(context).translate("Email"),
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                              SizedBox(height: defaultPadding),
                                              TextField(
                                                controller: passwordController,
                                                obscureText: true,
                                                decoration: InputDecoration(
                                                  labelText: AppLocalizations.of(context).translate("Password"),
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                              SizedBox(height: defaultPadding),
                                              ElevatedButton(
                                                style: ButtonStyle(

                                                ),
                                                onPressed: () {
                                                  print("Tài khoản: ${usernameController.text}");
                                                  print("Mật khẩu: ${passwordController.text}");
                                                  context.read<AuthBloc>().add(AuthenticateEvent(usernameController.text,passwordController.text));
                                                },
                                                child: Text(AppLocalizations.of(context).translate("Login")),
                                              ),
                                              SizedBox(height: defaultPadding),
                                              TextButton(
                                                onPressed: () {
                                                  print("Chuyển sang trang đăng ký");
                                                },
                                                child: Text(AppLocalizations.of(context).translate("Register")),
                                              ),
                                            ],
                                          )

                                        ],
                                      ))
                                ]
                            )
                        ),
                      ),
                    ),

                  ],
                )
              ],
            ),
          ),
        );
      },       listener: (context, state) {
      if (state is AuthError) {
        // Hiển thị AlertDialog khi có lỗi
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(state.message), // Hiển thị thông báo lỗi
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Đóng hộp thoại
                  },
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Đóng hộp thoại và thoát
                    // Có thể thêm logic thoát ứng dụng ở đây nếu cần
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    },

    );
  }
}
