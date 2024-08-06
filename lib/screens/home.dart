import 'package:flutter/material.dart';
import 'package:rmb/components/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about_us.dart';
import '../colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(

          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWelcomeSection(context, size),

              SizedBox(height: 50),
              _buildDescriptionSection(context, size),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildWelcomeSection(BuildContext context, Size size) {
    return SizedBox(
      height: size.height * 0.45,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 280,
              width: double.maxFinite,

              decoration: BoxDecoration(
                color: KPColors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                        color: Colors.white,),
                        SizedBox(width: 10),
                        Text(
                          'Dabhan Gujarat India',
                          style: TextStyle(
                              fontFamily: 'urbanist',
                              fontWeight: FontWeight.w400,
                          color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 15),
                    child: Text(
                      "Welcome! To",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "RAJESH MOTOR BODY",
                      style: Styles.textStyle,
                    ),
                  ),


                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 50),
                  //     child: Text(
                  //       "MOTOR",
                  //       style: Styles.textStyle,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 18),
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: Padding(
                  //     padding: EdgeInsets.only(right: 7),
                  //     child: Text(
                  //       "BODY",
                  //       style: Styles.textStyle,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 8),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: size.height * 0.24,
              width: size.width * 0.45,
              margin: EdgeInsets.only(left: 11),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Card(
                    elevation: 20,
                    child: Container(
                      height: size.height * 0.23,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/rmblogo.jpg"),
                        ),
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

  /// Section Widget
  Widget _buildDescriptionSection(BuildContext context, Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Container(
            width: MediaQuery.of(context).size.width / 1.1,
            height: (MediaQuery.of(context).size.width / 0.8) * 0.3,
            decoration: BoxDecoration(
              color: KPColors.lightBlue,
              borderRadius: BorderRadius.circular(20),

            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: FractionallySizedBox(
                    widthFactor: 0.3,  // Adjust this value to reduce the image size
                    child: Image.asset('assets/images/weld.png'),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,  // Change this to position the text as needed
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      'Your Journey, Our Craftsmanship',
                      style: TextStyle(
                        color: Colors.white,  // Adjust the color as needed
                        fontSize: 20,         // Adjust the font size as needed
                        fontWeight: FontWeight.bold, // Adjust the font weight as needed
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 58, left: 30),
                  child: Container(
                    width: 200,
                    height: 100,
                    child: Text('Crafting Durability, Delivering Quality. Driving Your Success, Mile After Mile.',
                      style: TextStyle(
                        color: Colors.white,  // Adjust the color as needed
                        fontSize: 15,         // Adjust the font size as needed
                        fontWeight: FontWeight.normal, // Adjust the font weight as needed
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),



        Padding(
          padding: const EdgeInsets.symmetric( horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              GestureDetector(
                onTap: (){
                  openMap(22.7101397, 72.8068703);

                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width / 5.5,
                  height: MediaQuery.of(context).size.width / 5.5,
                  decoration: BoxDecoration(
                    color: KPColors.blue,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Image.asset(
                    'assets/images/location1.jpg',
                    color: Colors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: _launchInstagram,
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width / 5.5,
                  height: MediaQuery.of(context).size.width / 5.5,
                  decoration: BoxDecoration(
                    color: KPColors.blue,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Image.asset(
                    'assets/images/insta.png',
                    color: Colors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: openWhatsapp,
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width / 5.5,
                  height: MediaQuery.of(context).size.width / 5.5,
                  decoration: BoxDecoration(
                    color: KPColors.blue,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Image.asset(
                    'assets/images/whatsapp.png',
                    color: Colors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  _launchGmail('rajeshmotorbody@gmail.com');
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width / 5.5,
                  height: MediaQuery.of(context).size.width / 5.5,
                  decoration: BoxDecoration(
                    color: KPColors.blue,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Image.asset(
                    'assets/images/email.png',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }

}
void _launchGmail(String email) async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: email,
  );
  String url = params.toString();
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> openMap(
    double Latitude,
    double Longitude,
    )async{
  String googleMapUrl = "https://www.google.com/maps/search/?api=1&query=22.7104663, 72.8049391";

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
final String instagramUrl = "https://www.instagram.com/rajeshmotorbody/";

void _launchInstagram() async {
  if (await canLaunch(instagramUrl)) {
    await launch(instagramUrl);
  } else {
    throw 'Could not launch $instagramUrl';
  }
}