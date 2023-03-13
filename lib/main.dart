import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lyse_app/src/pages/login_page.dart';
import 'package:lyse_app/src/pages/splash_screen.dart';
import 'package:lyse_app/src/pages/verification_login_page.dart';
import 'package:lyse_app/src/providers/login_provider.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) => runApp(const MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LYSE',
        theme: ThemeData(
          primaryColor: const Color(0xFF3ef777),
        ),
        initialRoute: "splash",
        routes: <String, WidgetBuilder>{
          "splash":(BuildContext context) => SplashScreen(),
          "login": (BuildContext context) => LoginPage(),
          "verificacion": (BuildContext context) => VerificationLoginPage(),
        },
      ),
    );
  }
}
