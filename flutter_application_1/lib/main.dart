import 'package:flutter/material.dart';
import 'index.dart';
import 'pages/search/SearchPage.dart';
import 'pages/sell/SellPage.dart';
import 'pages/account/AccountPage.dart';
import 'pages/like/FavoritPage.dart';
import 'pages/start/StartPage.dart';
import './common/Net.dart';
import 'common/Error.dart';

bool is_log = false;
bool is_connect = false;

void main(List<String> args)async{
  try {

    is_log = await User_Manage().is_log();
    is_connect = true;

  } catch (e) {
    print('request timeout');
    is_connect = false;
  }
    
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'myapp',
      initialRoute: is_connect?(is_log?'/':'start'):'error',
      routes: {
        '/':(context) => const HomePage(),
        '/search':(context) => const SearchPage(),
        '/sell':(context) => const SellPage(),
        '/favorit':(context) => const FavoritPage(),
        '/setting':(context) => const AccountPage(),
        'start':(context) => const StartPage(),
        'error':(context) => const ErrorPage()
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 190, 239, 201),
        //useMaterial3: true
      ),
    );  
  }
}