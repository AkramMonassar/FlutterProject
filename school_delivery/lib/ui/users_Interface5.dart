import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:school_delivery/ui/Feature/Login%20Screen/Login_Screen_Admin.dart';
import 'package:school_delivery/ui/Feature/Login%20Screen/Login_Screen_Guardian.dart';
import 'package:school_delivery/ui/Feature/Login%20Screen/Login_Screen_Supervisor.dart';
import 'package:school_delivery/ui/widgets/background_widget.dart';
import 'package:school_delivery/ui/widgets/backgroundsmal.dart';

class UserInterface5 extends StatelessWidget {
   UserInterface5({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffecefe4),
      body: Stack(
        children: <Widget>[
          const BackgroundWidget(),
          Positioned(
            top: 400,
            right: 80,
            left: 80,
            child: Column(
              children: [
                SizedBox(
                  width: 200,
                  child: MaterialButton(onPressed: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>LoginScreenAdmin()));
                  },
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1
                        )
                      ),
                    padding:  EdgeInsets.symmetric(horizontal: 0,vertical: 7),
                      child:  Text('مسؤول الحركة',style: TextStyle(fontSize: 30,color: Colors.black),),
                  ),
                )
              ]),
          ),
          Positioned(
            top: 500,
            right: 80,
            left: 80,
            child: Column(
                children: [
                  SizedBox(
                    width: 200,
                    child: MaterialButton(onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>LoginScreenSupervisor()));
                    },
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(
                              color: Colors.black,
                              width: 1
                          )
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 7),
                      child: const Text('المشرف',style: TextStyle(fontSize: 30,color: Colors.black),),
                    ),
                  )

                ]),
          ),
          Positioned(
            top: 600,
            right: 100,
            left: 100,
            child: Column(
                children: [
                  SizedBox(
                    width: 200,
                    child: MaterialButton(onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>LoginScreenGuardian()));
                    },
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(
                              color: Colors.black,
                              width: 1
                          )
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 7),
                      child: const Text('ولي الامر',style: TextStyle(fontSize: 30,color: Colors.black),),
                    ),
                  )

                ]),
          )
        ],
      ),
    );
  }
}
