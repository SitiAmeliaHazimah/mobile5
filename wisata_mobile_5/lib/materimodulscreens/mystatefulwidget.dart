import 'package:flutter/material.dart';

class Mystatefulwidget extends StatefulWidget {
  const Mystatefulwidget({super.key});

  @override
  State<Mystatefulwidget> createState() => _MystatefulwidgetState();
}

class _MystatefulwidgetState extends State<Mystatefulwidget> {
  var _JumlahHitungan = 0;

  void _tambahAngka() {
    setState(() {
      _JumlahHitungan++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "INI STATEFUL WIDGET",
      home: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$_JumlahHitungan",
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  _tambahAngka();
                },
                child: Text("TEKAN TOMBOL INI"))
          ],
        ),
      )),
    );
  }
}
