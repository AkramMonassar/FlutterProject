import 'package:flutter/material.dart';
import 'package:my_flutter_chat_ui/models/option_model.dart';

class MenuMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuMain();
  }
}

class _MenuMain extends State<MenuMain> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Menu Option'),
        leading: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            minimumSize: const Size(200, 50),
            textStyle: const TextStyle(fontSize: 18.0, color: Colors.white),
          ),
          child: const Icon(Icons.arrow_back),
          onPressed: () {print('Back');},
        ),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red,),
              onPressed: (){print('Help');},
              child: const Text('Help',style: TextStyle(fontSize: 16),)
          )],
      ),
      body: ListView.builder(
          itemCount: option.length,
          itemBuilder: (BuildContext context,int index){
           if(index==0){
             return SizedBox(height: 15.0);
           }else if(index==option.length+1)
             {
               SizedBox(height: 100.0);
             }
           return Container(
             alignment: Alignment.center,
             margin: EdgeInsets.all(10.0),
             width: double.infinity,
             height: 80.0,
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(10.0),
               border: Border.all(color: Colors.black26)
             ),
             child:ListTile(
               leading: Icon(option[index].icon),
               title: Text(
                 option[index]!.title!,style: TextStyle(
                 color: Colors.grey[600],
               ),
               ),
               subtitle: Text(
                 option[index]!.subtitle!,
                 style: const TextStyle(
                   color: Colors.grey
                 ),
               ),
             ) ,
           );
          })
    );
  }
}
