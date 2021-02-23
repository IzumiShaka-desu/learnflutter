import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learflutter/ui/view/home/home.dart';
import 'package:learflutter/ui/view/login_register/login_register.dart';
import 'package:learflutter/ui/viewmodels/auth_viewmodel.dart';
import 'package:learflutter/ui/viewmodels/main_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewmodel>(
          create: (context) => AuthViewmodel(),
        ),
        ChangeNotifierProvider<MainViewmodel>(
          create: (context) => MainViewmodel(),
        )
      ],
      builder: (context, _) {
        Provider.of<AuthViewmodel>(context).loadLoginDetails();
        return MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Provider.of<AuthViewmodel>(context, listen: false).isLogedIn
            ? Home()
            : LoginRegister(),
        debugShowCheckedModeBanner: false,
      );}
    );
  }
}
