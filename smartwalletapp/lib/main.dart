
// ignore_for_file: depend_on_referenced_packages, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:smartwalletapp/bloc/Register/RegistedBloc.dart';
import 'package:smartwalletapp/screens/authentication/login_screen.dart';
import 'package:smartwalletapp/screens/main/main_screen.dart';
import 'app/locallization/app_localizations.dart';
import 'app/theme/app_theme.dart';
import 'bloc/Auth/AuthBloc.dart';
import 'controllers/menu_app_controller.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        MultiProvider( providers: [
          ChangeNotifierProvider(
              create: (context) => MenuAppController(),
            ),
          BlocProvider(create: (context)=>AuthBloc()),
          BlocProvider(create: (context)=>RegisterBloc())
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
  Locale _locale = const Locale('vi'); // Ngôn ngữ mặc định là tiếng Anh
  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  // This widget is the root of your application.
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
      home: MainScreen(isAuth: true)
    );
  }
}
