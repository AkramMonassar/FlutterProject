import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:school_delivery/ui/widgets/background_widget.dart';
import './bus_Supervisors9.dart';
import './bus_Drivers10.dart';
import 'package:adobe_xd/page_link.dart';
import './settings23.dart';
import 'Feature/Login Screen/Login_Screen_Admin.dart';

class OptionsAdminDrivers8 extends StatelessWidget {
  const OptionsAdminDrivers8({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffecefe4),
      body: Stack(
        children: <Widget>[
          BackgroundWidget(),
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
                          MaterialPageRoute(builder: (context)=>BusSupervisors9()));
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
                      child:  Text('المشرفين',style: TextStyle(fontSize: 30,color: Colors.black),),
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
                          MaterialPageRoute(builder: (context)=>BusDrivers10()));
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
                      child: const Text('السائقين',style: TextStyle(fontSize: 30,color: Colors.black),),
                    ),
                  )

                ]),
          ),
          Pinned.fromPins(
            Pin(size: 42.0, start: 38.0),
            Pin(size: 34.0, start: 57.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => Settings23(),
                ),
              ],
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 8.0, start: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff707070)),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 7.0, end: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff707070)),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 10.0, middle: 0.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff707070)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
