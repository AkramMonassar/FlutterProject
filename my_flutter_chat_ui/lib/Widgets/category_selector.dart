import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({Key? key}) : super(key: key);

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex=0;
  final List<String> categories=['Messages','Online','Groups','Requests'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
          itemBuilder: (BuildContext context,int index){
            return GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex=index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 20.0),
                child: Text(categories[index],style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: index==selectedIndex?Colors.white:Colors.white60,
                  letterSpacing: 1.2,
                ),),
              ),
            );
          }),
    );
  }
}
