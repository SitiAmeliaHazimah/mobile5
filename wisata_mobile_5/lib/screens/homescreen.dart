import 'package:flutter/material.dart';
import 'package:wisata_mobile_5/models/destination_model.dart';
import 'package:wisata_mobile_5/screens/detaildestination.dart';
import 'package:wisata_mobile_5/utils/const.dart';
import 'package:wisata_mobile_5/widgets/popular_destination.dart';
import 'package:wisata_mobile_5/widgets/rekomendasi_destination.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPage = 0;
  List<IconData> icons = [
    Icons.home_filled,
    Icons.bookmark_border_rounded,
    Icons.shopping_cart_outlined,
    Icons.person_outline_outlined
  ];

  List<TravelDestination> popular = listDestination
      .where((element) => element.category == 'popular')
      .toList();
  List<TravelDestination> rekomendasi = listDestination
      .where((element) => element.category == 'rekomendasi')
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          buildAppBar(),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tempat Populer',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Text(
                  'Lihat Semua',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: blueTextColor),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(bottom: 20, left: 20),
            child: Row(
              children: List.generate(
                popular.length,
                (index) => Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetailDestinationScreen(
                                  destination: popular[index])));
                    },
                    child: PopularDestination(destination: popular[index]),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rekomendasi Untukmu',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Text(
                  'Lihat Semua',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: blueTextColor),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: List.generate(
                  rekomendasi.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DetailDestinationScreen(
                                    destination: rekomendasi[index])));
                      },
                      child: RekomendasiDestination(
                          destination: rekomendasi[index]),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                  decoration: BoxDecoration(
                      color: kButtonColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      icons.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPage = index;
                          });
                        },
                        child: Icon(
                          icons[index],
                          size: 32,
                          color: selectedPage == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25)
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget buildAppBar() {
  return Container(
    height: 120,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 5,
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    ),
    child: SafeArea(
        child: Center(
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 15, right: 15),
        child: buildSearchButton(),
      ),
    )),
  );
}

Widget buildSearchButton() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: kButtonColor,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 5))
      ],
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Cari Destinasi...',
        hintStyle: TextStyle(
          color: Colors.white54,
          fontSize: 18,
        ),
        prefixIcon: Icon(Icons.search, color: Colors.white54, size: 28),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 12),
      ),
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
  );
}
