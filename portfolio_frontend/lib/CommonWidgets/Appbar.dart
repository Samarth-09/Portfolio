import 'package:flutter/material.dart';
import 'package:portfolio/Providers/Home/HomeProvider.dart';
import 'package:portfolio/globals.dart';
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
      title: Image.asset('./assets/images/logo.png',
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
              return bttn.appBarButton(w, h, "Experience", 3, context, value);
            })),
        ChangeNotifierProvider(
            create: (context) => HomeProvider(),
            child: Consumer<HomeProvider>(builder: (context, value, child) {
              return bttn.appBarButton(w, h, "Contact Me", 4, context, value);
            }))
      ],
    );
  }

  AppBar mAppbar(double w) {
    return AppBar(
      // backgroundColor: const Color.fromARGB(255, 15, 13, 13),
      backgroundColor: globals.whitish,
      elevation: 0,
      // foregroundColor: Colors.white,
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: Image.asset(
        "./assets/images/logo.png",
        width: w * 0.3,
        fit: BoxFit.contain,
      ),
      // leading: IconButton(
      //     onPressed: () {
      //       Scaffold.of(context).openDrawer();
      //     },
      //     icon: Icon(Icons.menu_open_rounded,
      //         size: (w / 100) * 6, color: globals.brownish)),
    );
  }
}
