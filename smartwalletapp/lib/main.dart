
// ignore_for_file: depend_on_referenced_packages, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smartwalletapp/bloc/CardHolder/card_holder_bloc.dart';
import 'package:smartwalletapp/bloc/Contract/contract_bloc.dart';
import 'package:smartwalletapp/bloc/MainApp/main_app_bloc.dart';
import 'package:smartwalletapp/bloc/Register/RegistedBloc.dart';
import 'package:smartwalletapp/models/user.dart';
import 'package:smartwalletapp/screens/main/main_screen.dart';
import 'app/locallization/app_localizations.dart';
import 'app/theme/app_theme.dart';
import 'bloc/Auth/AuthBloc.dart';
import 'controllers/menu_app_controller.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/authentication/login_screen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        MultiProvider( providers: [
          ChangeNotifierProvider(
              create: (context) => MenuAppController(),
            ),
          BlocProvider(create: (context)=>AuthBloc()),
          BlocProvider(create: (context)=>RegisterBloc()),
          BlocProvider(create: (context)=>MainAppBloc()),
          BlocProvider(create: (context)=>CardHolderBloc()),
          BlocProvider(create: (context)=>ContractBloc())
            ]
          )
        ],
      child:MyApp()
      ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');
  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  // This widget is the root of your application.
  User u = User(
    userId: '1',
    username: 'john_doe',
    password: 'password123',
    phoneNumber: '123-456-7890',
    homeAddress: '123 Main St',
    companyAddress: '456 Business Blvd',
    lastName: 'Doe',
    firstName: 'John',
    avatar: 'assets/images/profile_pic.png',
    email: 'john.doe@example.com',
    createdDate: DateTime(2023, 5, 1),
    updateDate: DateTime(2024, 1, 1),
    status: true,
  );
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: AppTheme.lightTheme, // Áp dụng Light Theme
      darkTheme: AppTheme.darkTheme, // Áp dụng Dark Theme
      themeMode: ThemeMode.system,
      locale: _locale, // Áp dụng ngôn ngữ hiện tại
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('vi', ''), // Vietnamese
      ],
      home: 
      MainScreen(isAuth: true, user: u, onLanguageChange: (Locale newLocale) {
        Get.updateLocale(newLocale);
      }, token: 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJzbWFydHdhbGxldGFwcCIsInN1YiI6ImFkbWluMSIsImV4cCI6MTc0Mjk5NTAwMywiaWF0IjoxNzQyOTg2MDAzLCJzY29wZSI6IkFETUlOIn0.WJCA6l0QtLz08BbnfTZXChYE296C4W1mfqBcGlrKfW0',)
      // LoginScreen(isAuth: false, onLanguageChange: (Locale newLocale) {
      //   Get.updateLocale(newLocale);
      //  },)
    );
  }
}
