// ignore_for_file: avoid_print, unused_field, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/bloc/Register/RegistedState.dart';
import 'package:smartwalletapp/models/user.dart';
import 'package:smartwalletapp/screens/authentication/login_screen.dart';
import '../../bloc/Register/RegistedBloc.dart';
import '../../bloc/Register/RegistedEvent.dart';
import '../../constants.dart';
import '../dashboard/components/header.dart';
import '../../responsive.dart';
import '../main/components/side_menu.dart';
class RegisterScreen extends StatefulWidget {
  final bool isAuth;
  const RegisterScreen({super.key,
    required this.isAuth,
  });
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  int _currentTab = 1;
  final GlobalKey<ScaffoldState> _registerscaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repassController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _homeAddressController = TextEditingController();
  final TextEditingController _companyAddressController = TextEditingController();
  final TextEditingController _numberPhoneController = TextEditingController();
  bool result = false;


  @override
  void initState() {
    super.initState();


  }
  late User user = User(
    username: "",
    password: "",
    phoneNumber: "",
    homeAddress: "",
    companyAddress: "",
    lastName: "",
    firstName: "",
    avatar: "", email: '',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _registerscaffoldKey,
      drawer: SideMenu(onMenuTap: (int index) {
        setState(() {
          _currentTab = index;
        });
      }),
      body: BlocConsumer<RegisterBloc,RegisterState>(
        builder: (context,state){
          if(state is RegisterSuccess){
            result = state.isRegis;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(isAuth: false),
              ),
            );
          }
          return SafeArea(
            child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // We want this side menu only for large screen
              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 2,
                  // default flex = 1
                  // and it takes 1/6 part of the screen
                  child: SideMenu(onMenuTap: (int index) {
                    setState(() {
                      _currentTab = index;
                    });
                  }),
                ),
              Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child: SingleChildScrollView(
                  primary: false,
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      Header(title: AppLocalizations.of(context).translate("Register"),user: user, isAuth: widget.isAuth,),
                      SizedBox(height: defaultPadding),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child:
                            Container(
                              padding: EdgeInsets.all(defaultPadding),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: defaultPadding,),
                                  Row(
                                    children: [
                                      Expanded( // Bọc từng Column bằng Expanded để tránh lỗi
                                        child: Column(
                                          children: [
                                            TestFiles(editController: _usernameController, title: 'UserName',),
                                            // user name
                                            SizedBox(height: defaultPadding),
                                            TestFiles(editController: _passwordController, title: 'Password',),
                                            // password
                                            SizedBox(height: defaultPadding),
                                            TestFiles(editController: _repassController, title: 'RePassword',),
                                            // re password
                                            SizedBox(height: defaultPadding),
                                            TestFiles(editController: _lastnameController, title: 'LastName',),
                                            // last name
                                            SizedBox(height: defaultPadding),
                                            TestFiles(editController: _firstnameController, title: 'FirstName',),
                                            // first name
                                            SizedBox(height: defaultPadding),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: Get.width/30,),
                                      Expanded( // Bọc cột thứ 2 để tránh lỗi
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            // home add
                                            TestFiles(editController: _homeAddressController, title: 'HomeAddress',),
                                            SizedBox(height: defaultPadding),
                                            // company add
                                            TestFiles(editController: _companyAddressController, title: 'CompanyAddress',),
                                            SizedBox(height: defaultPadding),
                                            // email
                                            TestFiles(editController: _emailController, title: 'Email',),
                                            SizedBox(height: defaultPadding),
                                            // dia chi cong ty
                                            TestFiles(editController: _numberPhoneController, title: 'Phone',),
                                            SizedBox(height: defaultPadding),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(AppLocalizations.of(context).translate("Account?")),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Theme.of(context).colorScheme.onPrimary,
                                          disabledForegroundColor: Theme.of(context).colorScheme.onPrimary, // Màu khi bị vô hiệu hóa
                                        ),
                                        onPressed: () {
                                          Get.to(LoginScreen(isAuth: widget.isAuth));
                                        },
                                        child: Text(AppLocalizations.of(context).translate("Login")),
                                      ),
                                      SizedBox(width: defaultPadding),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Theme.of(context).colorScheme.secondary,
                                          backgroundColor: Theme.of(context).colorScheme.onPrimary, // Màu chữ trên nền chính
                                        ),
                                        onPressed: () {
                                          FocusScope.of(context).unfocus();
                                          context.read<RegisterBloc>().add(
                                              RegisteredEvent(
                                                  _usernameController.text,
                                                  _passwordController.text,
                                                  _repassController.text,
                                                  _firstnameController.text,
                                                  _lastnameController.text,
                                                  _emailController.text,
                                                  _homeAddressController.text,
                                                  _companyAddressController.text,
                                                  _numberPhoneController.text)

                                          );
                                        },
                                        child: Text(AppLocalizations.of(context).translate("Register")),
                                      ),
                                    ],
                                  ),
                                ],
                              ),


                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          );
        },       listener: (context, state) {
        if (state is RegisterError) {
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
                      Navigator.of(context).pop();// Đóng hộp thoại
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
      ),
    );

  }
}
class TestFiles extends StatelessWidget {
  final TextEditingController editController;
  final String title;
  final FocusNode focusNode = FocusNode(); // Thêm FocusNode

  TestFiles({super.key, required this.editController, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: editController,
        focusNode: focusNode, // Gán FocusNode vào đây
        obscureText: title.toLowerCase().contains("Password"), // Ẩn nếu là mật khẩu
        onTap: () {
          if (!focusNode.hasFocus) {
            focusNode.requestFocus(); // Đảm bảo được focus
          }
        },
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context).translate(title),
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      ),
    );
  }
}





