import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:school_delivery/ui/widgets/backgroundsmal.dart';
import './student_Parent20.dart';
import 'package:adobe_xd/page_link.dart';
import './settings23.dart';

class NotificationsParent22 extends StatelessWidget {
  const NotificationsParent22({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffecefe4),
      body: Stack(
        children: <Widget>[
          BackgroundSmall(),
          Pinned.fromPins(
            Pin(size: 168.0, middle: 0.437),
            Pin(size: 167.0, start: 57.0),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/schoolbus.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          const Align(
            alignment: Alignment(-0.132, -0.231),
            child: SizedBox(
              width: 104.0,
              height: 35.0,
              child: Text(
                'الاشعارات',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 26,
                  color: Color(0xff000000),
                ),
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 208.0, end: -5.5),
            Pin(size: 24.0, middle: 0.4797),
            child: const Text(
              'لم يصعد الطالب الى الحافلة',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 18,
                color: Color(0xff000000),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 90.0, middle: 0.5348),
            Pin(size: 56.0, end: 20.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => StudentParent20(),
                ),
              ],
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(37.0),
                  border:
                      Border.all(width: 1.0, color: const Color(0xff707070)),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 54.0, middle: 0.5384),
            Pin(size: 35.0, end: 31.5),
            child: const Text(
              'رجوع',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 26,
                color: Color(0xff000000),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 208.0, end: -5.5),
            Pin(size: 24.0, middle: 0.7961),
            child: const Text(
              'لم يصعد الطالب الى الحافلة',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 18,
                color: Color(0xff000000),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 208.0, end: -5.5),
            Pin(size: 24.0, middle: 0.7115),
            child: const Text(
              'لم يصعد الطالب الى الحافلة',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 18,
                color: Color(0xff000000),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 208.0, end: -5.5),
            Pin(size: 24.0, middle: 0.6269),
            child: const Text(
              'لم يصعد الطالب الى الحافلة',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 18,
                color: Color(0xff000000),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 208.0, end: -5.5),
            Pin(size: 24.0, middle: 0.5643),
            child: const Text(
              'لم يصعد الطالب الى الحافلة',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 18,
                color: Color(0xff000000),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 42.0, start: 25.0),
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
