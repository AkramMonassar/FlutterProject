import 'package:flutter/material.dart';
import 'package:myprovider/ui/SecondScreen.dart';
import 'package:provider/provider.dart';
import 'package:myprovider/Providers/CountProvider.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('This is count app:${context.watch<CountProviders>().count}'),
        ),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text('This is count :${context.watch<CountProviders>().count}'),
              // Count(),
              ElevatedButton(
                  onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen()));
              },
                  child: const Text('To Second Screen'))
            ],
          ),
        ),
        floatingActionButton:Row(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            FloatingActionButton(
                onPressed: ()=>context.read<CountProviders>().decrement()
                ,child: const Text('-',style: TextStyle(fontSize: 25),)),
            const SizedBox(width: 10,),
            FloatingActionButton(
                onPressed: ()=>context.read<CountProviders>().reset()
                ,child: const Text('0',style:  TextStyle(fontSize: 25),)),
            const SizedBox(width: 10,),
            FloatingActionButton(
                onPressed: ()=>context.read<CountProviders>().increment(),
                child: const Text('+',style:  TextStyle(fontSize: 25),)),
          ],
        ),
      ),
    );
  }

}

// class Count extends StatelessWidget {
//   Count({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Text('${context.watch<CountProviders>().count}',
//         key: Key('counterState'), style: Theme.of(context).textTheme.headline4);
//   }
// }