import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wisata_mobile_5/screens/landingpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    //menunda sebanyak 3 detik
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const Landingpage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Lottie.network(
                'https://lottie.host/956e1e4f-8c98-4206-ae82-50dd50161d69/dtw01aXDDE.json',
                width: 350,
                height: 350),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 300,
                ),
                Text(
                  'ASLABTIF',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1B1B1B)),
                ),
                Text(
                  'TRAVEL',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1B1B1B)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
