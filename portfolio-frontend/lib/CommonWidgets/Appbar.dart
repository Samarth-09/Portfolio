import 'package:flutter/material.dart';
import 'package:portfolio/Providers/Home/HomeProvider.dart';
import 'package:provider/provider.dart';
import 'Buttons.dart';

class Appbar {
  Buttons bttn = Buttons();
  AppBar appbar(double w, double h, BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      foregroundColor: Colors.white,
      shadowColor: Colors.white,
      title: Image.asset('/images/logo.png',
          width: (w / 100) * 12, height: (h / 100) * 7, fit: BoxFit.fill),
      actions: [
        ChangeNotifierProvider(
            create: (context) => HomeProvider(),
            child: Consumer<HomeProvider>(builder: (context, value, child) {
              return bttn.appBarButton(w, h, "Home", 0, context, value);
            })), //aaiya derek par changenotiferprovider lagai daisu annne value pass kar daisu aane appbar wada fn ma homeprovider no fn call karsu
        ChangeNotifierProvider(
            create: (context) => HomeProvider(),
            child: Consumer<HomeProvider>(builder: (context, value, child) {
              return bttn.appBarButton(w, h, "Projects", 1, context, value);
            })),
        ChangeNotifierProvider(
            create: (context) => HomeProvider(),
            child: Consumer<HomeProvider>(builder: (context, value, child) {
              return bttn.appBarButton(w, h, "Skills", 2, context, value);
            })),
        ChangeNotifierProvider(
            create: (context) => HomeProvider(),
            child: Consumer<HomeProvider>(builder: (context, value, child) {
              return bttn.appBarButton(w, h, "Contact Me", 3, context, value);
            }))
      ],
    );
  }
}
