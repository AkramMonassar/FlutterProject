import 'package:flutter/material.dart';
import 'package:myprovider/Providers/CountProvider.dart';
import 'package:myprovider/Providers/shopCartProvider.dart';
import 'package:myprovider/ui/HomeScreenUi.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(providers:[
      ChangeNotifierProvider(create: (_)=>CountProviders()),
      ChangeNotifierProvider(create: (_)=>ShopCart())
    ],
    child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: HomeScreen()),
    );
  }

}