import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sokosellers/view/sokoScreens/pages/filter.dart';
import 'package:sokosellers/view/sokoScreens/pages/widget/placeholders.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:buildAppBar2(), //buildAppBar(60, context) ,
        body: Center(
          child: Container(
            child: PlaceholderWidget(),
          )),
      ),
    );
  }

// buildAppBar(statusBarHeight, context),
  
  AppBar buildAppBar(double statusBarHeight, BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      // Don't show the leading button
      backgroundColor: Colors.white,
      centerTitle: false,
      elevation: 0,
      flexibleSpace: Padding(
          // padding:
          //     const EdgeInsets.only(top: 40.0, bottom: 22, left: 18, right: 18),
          padding:
          const EdgeInsets.only(top: 20.0, bottom: 22, left: 18, right: 18),
          child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Filter();
                }));
              },
              child: buildHomeSearchBox(context))),
    );
  }

AppBar buildAppBar2() {
    return AppBar(
            title: Text(
        'SOKO',
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20, // You can adjust the font size as needed
          ),
        ),
      ),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Add your search action here
                },
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  // Add your notifications action here
                },
              ),
            ],
          );
  }
  
buildHomeSearchBox(BuildContext context) {}



}