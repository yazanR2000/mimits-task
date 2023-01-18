import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/view_models/AuthViewModel.dart';
import 'package:task/view_models/HomeViewModel.dart';
import 'package:task/views/Home.dart';
import 'package:task/views/StartingScreen.dart';

import 'views/Auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeViewModel(),
        ),
        ChangeNotifierProvider.value(
          value: AuthViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Mimits task",
        theme: ThemeData(
          fontFamily: 'OpenSans-Regular',
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
              fontFamily: 'OpenSans-Bold',
            ),
            headlineMedium: TextStyle(
              fontFamily: 'OpenSans-Bold',
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              elevation: 0,
              //backgroundColor: Colors.white,
              foregroundColor: Colors.white,
              //padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            ),
          ),
        ),
        home: Builder(
          builder: (ctx) => FutureBuilder(
            future: Provider.of<AuthViewModel>(ctx).isAuth(),
            builder: (ctx, snapshot) {
              bool isUserAuth = Provider.of<AuthViewModel>(ctx,listen: false).isUserAuth;
              if(isUserAuth){
                return const StartingScreen();
              }
              return Auth();
            },
          ),
        ),
        routes: {
          Home.routeName: (context) => const Home(),
          Auth.routeName :(context) => Auth()
        },
      ),
    );
  }
}

class MyAppText extends StatelessWidget {
  const MyAppText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
