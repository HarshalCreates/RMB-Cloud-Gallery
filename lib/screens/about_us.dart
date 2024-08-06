import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../colors.dart';

class aboutus extends StatelessWidget {





  const aboutus({Key? key}) : super(key: key);

  Future<void> openMap(
      double Latitude,
      double Longitude,
      )async{
    String googleMapUrl = "https://www.google.com/maps/search/?api=1&query=$Latitude, $Longitude";

    if (await canLaunch(googleMapUrl)){
      await launch(googleMapUrl);
    }else{
      throw 'Could not open the Map';
    }
  }

  Future<void> openWhatsapp() async{


    var androidUrl = "https://wa.me/919427087592";

    if (await canLaunch(androidUrl)){
      await launch(androidUrl);
    }else{
      throw 'Could not open the Whatsapp';
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('About Us'),
      ),
      body: Container(
        child:  Column(
          children: [
            Row(


              children: [
                imageview(
                  assets: AssetImage("assets/images/manoj.png"),
                ),
                imageview(
                  assets: AssetImage("assets/images/rajesh.png"),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Manoj Sharma',
                  style: TextStyle(
                    fontSize: 20
                  ),),
                  Text('Rajesh Sharma',
                      style: TextStyle(
                          fontSize: 20
                      ),)
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: openWhatsapp1,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width / 2.3,
                      height: MediaQuery.of(context).size.width / 7,
                      decoration: BoxDecoration(
                        color: KPColors.lightBlue,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Image.asset(
                        'assets/images/whatsapp.png',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: openWhatsapp2,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width / 2.3,
                      height: MediaQuery.of(context).size.width / 7,
                      decoration: BoxDecoration(
                        color: KPColors.lightBlue,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Image.asset(
                        'assets/images/whatsapp.png',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: _makePhoneCall1,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width / 2.3,
                      height: MediaQuery.of(context).size.width / 7,
                      decoration: BoxDecoration(
                        color: KPColors.lightBlue,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        Icons.phone_outlined
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: _makePhoneCall2,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width / 2.3,
                      height: MediaQuery.of(context).size.width / 7,
                      decoration: BoxDecoration(
                        color: KPColors.lightBlue,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(Icons.phone_outlined
                      )
                    ),
                  ),
                ],
              ),
            ),



            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Container(

                width: 300,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Our Address',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Rajesh Motor Body Works\nNH8 near CNG Pump\nDabhan, Nadiad, Gujarat, 387320\nIndia',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Align(
                alignment: Alignment.bottomRight,
                  child: Text('Developed by Harshal Sharma')),
            )


          ],
        ),
      ),
    );
  }
// Future<void> _launchUrl(String urlString) async {
//   if(await canLaunch(urlString)) {
//     await launch(
//       urlString,
//       forceWebView: true,
//     );
//   } else {
//     print("Can\'t Launch Url");
//   }
// }

}

class imageview extends StatelessWidget {
  const imageview({
    required this.assets,
  });
  final AssetImage assets;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 17, top: 50),
          height: 150,
          width: 168,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 12),
          height: 200,
          width: 175,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: assets,
                fit: BoxFit.cover,

              )


          ),
        ),

      ],
    );
  }

}
void _makePhoneCall1() async {
  const phoneNumber = 'tel:+919427087592';  // Replace with the desired phone number

  if (await canLaunch(phoneNumber)) {
    await launch(phoneNumber);
  } else {
    throw 'Could not launch $phoneNumber';
  }
}
void _makePhoneCall2() async {
  const phoneNumber = 'tel:+919428486739';  // Replace with the desired phone number

  if (await canLaunch(phoneNumber)) {
    await launch(phoneNumber);
  } else {
    throw 'Could not launch $phoneNumber';
  }
}

Future<void> openWhatsapp1() async{


  var androidUrl = "https://wa.me/919427087592";

  if (await canLaunch(androidUrl)){
    await launch(androidUrl);
  }else{
    throw 'Could not open the Whatsapp';
  }
}
Future<void> openWhatsapp2() async{


  var androidUrl = "https://wa.me/919428486739";

  if (await canLaunch(androidUrl)){
    await launch(androidUrl);
  }else{
    throw 'Could not open the Whatsapp';
  }
}