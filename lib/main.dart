import 'package:flutter/material.dart';
import 'package:getx_app/MainDesignationScreen.dart';
import 'package:getx_app/designation.dart';
// import 'package:getx_app/designationmodel.dart';
import 'package:getx_app/exmaple_two.dart';
import 'package:getx_app/favrateapp.dart';
import 'package:getx_app/home_screen.dart';
import 'package:getx_app/imagepicker.dart';
import 'package:getx_app/location.dart';
import 'package:getx_app/locationlistpage.dart';
import 'package:getx_app/login_homeScreen.dart';
import 'package:getx_app/navbar/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      // home: ExampleTwo(),
      // home: FavApp(),
      // home: Imagepicker(),
      // home: AuthPage() ,
      // home: LocationView() ,
      // home: LocationWithoutIcon() ,
      // home: LocationListPage() ,
      // home: DesignationScreen() ,
      // home: ResponsiveNavBar(),
      home: MainDesignationScreen(),
    );
  }
}


