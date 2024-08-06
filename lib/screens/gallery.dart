import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rmb/colors.dart';
import 'package:rmb/variants/bolero.dart';
import 'package:rmb/variants/camerauploaded.dart';
import 'package:rmb/variants/container.dart';
import 'package:rmb/variants/eicher.dart';
import 'package:rmb/screens/home.dart';
import 'package:rmb/variants/eichercurtains.dart';
import 'package:rmb/variants/truck.dart';

import '../variants/tempo.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  List imageList = [
    {"id": 1, "image_path": 'assets/images/truckimg3.jpg'},
    {"id": 2, "image_path": 'assets/images/rmblogo.jpg'},
    {"id": 3, "image_path": 'assets/images/truckimg.jpg'},
    {"id": 4, "image_path": 'assets/images/truckimg2.jpg'},
    {"id": 5, "image_path": 'assets/images/truckimg4.jpg'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Gallery"),
      ),
      body: Column(children: [
        Stack(
          children: [
            InkWell(
              onTap: () {
                print(currentIndex);
              },
              child: CarouselSlider(

                items: imageList
                    .map(
                      (item) => Image.asset(
                    item['image_path'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                )
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(


                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: currentIndex == entry.key ? 17 : 7,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == entry.key
                              ? Color(0xff013365)
                              : Colors.teal),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        Container(
          color: Color(0xFFFDFDFD),
          width: 400,
          height: MediaQuery.of(context).size.height - 407.5,
          child:  SingleChildScrollView(scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  children: [
            GestureDetector(onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context)=>Eicher()))},

              child: ScrollContainer(
                assets: AssetImage("assets/images/eicher.png"),


              ),
            ),
            GestureDetector(onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context)=>Eichercurtains()))},
              child: ScrollContainer(
                        assets: AssetImage("assets/images/eicher2.png"),
                      ),
            ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context)=>container()))},
                      child: ScrollContainer(
                        assets: AssetImage("assets/images/container.png"),
                      ),
                    ),
                    GestureDetector(onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context)=>Truck()))},
                      child: ScrollContainer(
                        assets: AssetImage("assets/images/truck2.png"),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context)=>Bolero()))},
                      child: ScrollContainer(
                        assets: AssetImage("assets/images/pickup.png"),
                      ),
                    ),
                    GestureDetector(onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context)=>Tempo()))},
                      child: ScrollContainer(
                        assets: AssetImage("assets/images/tempo.png"),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ScrollContainer(
                      assets: AssetImage("assets/images/truck.png"),

                    ),
                    GestureDetector(
                      onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context)=>Camerauploaded()))},
                      child: ScrollContainer(

                        assets: AssetImage("assets/images/truck.png"),

                      ),
                    ),
                  ],
                ),


                
              ],
            ),
          ),
        )
      ]),

    );
  }
}

class ScrollContainer extends StatelessWidget {
  const ScrollContainer({
    required this.assets,
  });
final AssetImage assets;



  @override
  Widget build(BuildContext context) {

    return Container(



      margin: EdgeInsets.all(22),
      height: 150,
      width: 150,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: KPColors.lightBlue,
        image: DecorationImage(
          fit: BoxFit.scaleDown,
          image: assets,

        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}







class SliverListBldr extends StatelessWidget {
  const SliverListBldr({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(left:20 , bottom: 20, right: 10),
            child: Container(

              decoration: BoxDecoration(


                color: Colors.black.withOpacity(0.3),
              ),
              height: 200,
              width: MediaQuery.of(context).size.width,
            ),
          );
        },
        childCount: 20,
      ),
    );
  }
}