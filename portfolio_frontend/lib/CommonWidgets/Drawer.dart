import 'package:flutter/material.dart';
import 'package:portfolio/globals.dart';
import 'package:portfolio/routes.dart';

class MyDrawer {
  Widget drawer(double w, double h, BuildContext context) {
    return Drawer(
        backgroundColor: globals.greyish,
        elevation: 1,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                await Navigator.pushNamed(context, routes.home);
              },
              child: Container(
                  margin: EdgeInsets.only(top: (h / 100) * 4),
                  child: Text(
                    "Home",
                    style: globals.ts(
                        (w / 100) * 5, globals.brownish, FontWeight.bold),
                  )),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: (w / 100) * 5),
                margin: EdgeInsets.only(top: (h / 100) * 4),
                child: Divider(color: globals.brownish, thickness: 0.5)),
            InkWell(
              onTap: () async {
                await Navigator.pushNamed(context, routes.projects);
              },
              child: Container(
                  margin: EdgeInsets.only(top: (h / 100) * 4),
                  child: Text(
                    "Projects",
                    style: globals.ts(
                        (w / 100) * 5, globals.brownish, FontWeight.bold),
                  )),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: (w / 100) * 5),
                margin: EdgeInsets.only(top: (h / 100) * 4),
                child: Divider(color: globals.brownish, thickness: 0.5)),
            InkWell(
              onTap: () async {
                await Navigator.pushNamed(context, routes.skills);
              },
              child: Container(
                  margin: EdgeInsets.only(top: (h / 100) * 4),
                  child: Text(
                    "Skills",
                    style: globals.ts(
                        (w / 100) * 5, globals.brownish, FontWeight.bold),
                  )),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: (w / 100) * 5),
                margin: EdgeInsets.only(top: (h / 100) * 4),
                child: Divider(color: globals.brownish, thickness: 0.5)),
            InkWell(
              onTap: () async {
                await Navigator.pushNamed(context, routes.Experience);
              },
              child: Container(
                  margin: EdgeInsets.only(top: (h / 100) * 4),
                  child: Text(
                    "Experience",
                    style: globals.ts(
                        (w / 100) * 5, globals.brownish, FontWeight.bold),
                  )),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: (w / 100) * 5),
                margin: EdgeInsets.only(top: (h / 100) * 4),
                child: Divider(color: globals.brownish, thickness: 0.5)),
            InkWell(
              onTap: () async {
                await Navigator.pushNamed(context, routes.contactMe);
              },
              child: Container(
                  margin: EdgeInsets.only(top: (h / 100) * 4),
                  child: Text(
                    "Contact Me",
                    style: globals.ts(
                        (w / 100) * 5, globals.brownish, FontWeight.bold),
                  )),
            ),

            // Container(
            //     padding:
            //         EdgeInsets.symmetric(horizontal: (w / 100) * 5),
            //     margin: EdgeInsets.only(top: (h / 100) * 1),
            //     child: Divider(color: globals.brownish, thickness: 0.5))
          ],
        )));
  }
}
