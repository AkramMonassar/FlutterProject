import 'package:flutter/material.dart';
import 'package:myprovider/Providers/CountProvider.dart';
import 'package:myprovider/Providers/shopCartProvider.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('This is count :${context.watch<CountProviders>().count}'),),
      body:  Center(
        child: Text('This is count:${context.watch<ShopCart>().cart}'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: ()=>context.read<ShopCart>().additem('akram'),
            child: const Text('add',style: TextStyle(fontSize: 17),),),
        ],
      ),
    );
  }

}