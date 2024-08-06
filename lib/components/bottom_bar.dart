
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:rmb/screens/gallery.dart';
import 'package:rmb/screens/home.dart';
import 'package:rmb/screens/camera.dart';
import 'package:rmb/screens/about_us.dart';

import '../colors.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int _selectedIndex = 0;

  static final List<Widget>_widgetOption=<Widget>[
    const Home(),
    const SliderScreen(),
    const CameraScreen(),
    const aboutus(),
  ];
  void _onItemTapped (int Index){
    setState(() {
      _selectedIndex=Index;
    });
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: KPColors.blue,





      //  appBar:AppBar(

      //    centerTitle: true,
      //    backgroundColor: Colors.blue,
      //    title:
      //     Text('My Ticket', textAlign: TextAlign.center
      //   ),
      // ),
      body:
      Center(

          child: _widgetOption[_selectedIndex]
      ),

      bottomNavigationBar:



      Container(

        margin: EdgeInsets.all(20),
        height: size.width * .13,
        decoration: BoxDecoration(

          color: Colors.white,

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),

        child: ListView.builder(

          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: size.width * .024),
          itemBuilder: (context, index) =>
              InkWell(

                onTap: () {
                  setState(
                        () {
                      _selectedIndex = index;
                    },
                  );
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.fastLinearToSlowEaseIn,

                      margin: EdgeInsets.only(
                        bottom: index == _selectedIndex ? 0 : size.width * .029,
                        right: size.width * .06,
                        left: size.width * .06,
                      ),
                      width: size.width * .09,
                      height: index == _selectedIndex ? size.width * .008: 0,
                      decoration: BoxDecoration(
                        color: Color(0xff92A8C6),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(10),
                        ),
                      ),
                    ),
                    Icon(
                      listOfIcons[index],
                      size: size.width * .065,
                      color: index == _selectedIndex
                          ? Color(0xff92A8C6)
                          : Colors.grey,
                    ),

                    SizedBox(height: size.width * .02)
                    ,
                  ],
                ),
              ),
        ),

      ),

    );
  }
  List<IconData> listOfIcons = [
    FluentSystemIcons.ic_fluent_home_filled,
    CupertinoIcons.photo_fill_on_rectangle_fill,
   Icons.camera_enhance,
    FluentSystemIcons.ic_fluent_person_filled,
  ];


}

