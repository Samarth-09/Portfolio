import 'package:flutter/material.dart';
import 'package:portfolio/Providers/Home/HomeProvider.dart';
import 'package:portfolio/Providers/Projects/ProjectsProvider.dart';
import 'package:portfolio/globals.dart';
import 'package:portfolio/routes.dart';

class Buttons {
  Widget appBarButton(double w, double h, String s, int i, BuildContext context,
      HomeProvider hp) {
    return InkWell(
      highlightColor: globals.transparent,
      // focusColor: globals.transparent,
      hoverColor: globals.transparent,
      splashColor: globals.transparent,
      onHover: (value) => hp.changeHover(value),
      onTap: () async {
        if (i == 0) {
          globals.currentTab = 0;
          await Navigator.pushNamed(context, routes.home);
        } else if (i == 1) {
          globals.currentTab = 1;
          await Navigator.pushNamed(context, routes.projects);
        } else if (i == 2) {
          globals.currentTab = 2;
          await Navigator.pushNamed(context, routes.skills);
        } else if (i == 3) {
          globals.currentTab = 3;
          await Navigator.pushNamed(context, routes.contactMe);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.bounceOut,
          margin: EdgeInsets.symmetric(horizontal: (w / 100) * 1),
          padding: EdgeInsets.symmetric(
              vertical: (h / 100) * 1, horizontal: (w / 100) * 0.75),
          decoration: BoxDecoration(
              border: Border.all(
                  width: (w / 100) * 0.1,
                  color: (globals.currentTab == i)
                      ? (hp.isHovered)
                          ? Colors.transparent
                          : globals.brownish
                      : (hp.isHovered)
                          ? globals.transparent
                          : globals.blackish),
              color: (hp.isHovered) ? globals.brownish : globals.transparent),
          child: Text(s,
              style: globals.ts(
                  (w / 100) * 1.25,
                  (globals.currentTab == i)
                      ? (hp.isHovered)
                          ? Colors.white
                          : globals.brownish
                      : (hp.isHovered)
                          ? Colors.white
                          : globals.blackish,
                  null))),
    );
  }

  Widget projectTitle(double w, double h, String name) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: (h / 100) * 3.5, horizontal: (w / 100) * 1.25),
        color: globals.brownish,
        child: Text(name,
            style: globals.ts((w / 100) * 1.5, Colors.white, FontWeight.bold)));
  }

  Widget projectButton(double w, double h, String s, String url, Color bttnClr,
      BuildContext context, ProjectsProvider pp) {
    return InkWell(
      onHover: (value) => pp.changeHover(value),
      onTap: () async {
        globals.launchURL(url, w, context);
      },
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          // margin: EdgeInsets.only(left: (w / 100) * 1.5, top: (h / 100) * 6),
          padding: EdgeInsets.symmetric(
              vertical: (h / 100) * 1, horizontal: (w / 100) * 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  width: (w / 100) * 0.1,
                  color:
                      (pp.isHovered) ? globals.transparent : globals.blackish),
              color: (pp.isHovered) ? globals.brownish : globals.transparent),
          child: Text(s,
              style: globals.ts((w / 100) * 1.25,
                  (pp.isHovered) ? globals.whitish : globals.blackish, null))),
    );
  }

  Widget linksButton(double w, double h, String s, int i, BuildContext context,
      HomeProvider hp,
      [String? url]) {
    return InkWell(
      onHover: (value) {
        hp.changeHover(value);
      },
      onTap: () async {
        if (i == 1) {
          globals.launchURL(
              "https://www.linkedin.com/in/samarth-parekh-8948492a8/",
              w,
              context);
        } else if (i == 2) {
          globals.launchURL("https://github.com/Samarth-09", w, context);
        } else if (i == 3) {
          globals.launchURL("https://leetcode.com/srparekh0909/", w, context);
        } else if (i == 4) {
          globals.launchURL(
              "https://www.codechef.com/users/samarth0909", w, context);
        } else if (i == 5) {
          globals.launchURL(
              "https://www.hackerrank.com/profile/IT068_Samarth", w, context);
        } else if (i == -1) {
          globals.launchURL(url!, w, context);
        }
      },
      child: AnimatedContainer(
          curve: Curves.bounceOut,
          duration: Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: (w / 100) * 1),
          padding: EdgeInsets.symmetric(
              vertical: (h / 100) * 1, horizontal: (w / 100) * 1.25),
          decoration: BoxDecoration(
              border: Border.all(
                  width: (w / 100) * 0.1,
                  color:
                      (hp.isHovered) ? globals.transparent : globals.blackish),
              color: (hp.isHovered) ? globals.brownish : globals.transparent),
          child: Text(s,
              style: globals.ts((w / 100) * 1.25,
                  (hp.isHovered) ? Colors.white : globals.blackish, null))),
    );
  }

  Widget hoveredLinksButton(
      double w, double h, String s, int i, BuildContext context,
      [String? url]) {
    return InkWell(
      onTap: () async {
        if (i == 1) {
          globals.launchURL(
              "https://www.linkedin.com/in/samarth-parekh-8948492a8/",
              w,
              context);
        } else if (i == 2) {
          globals.launchURL("https://github.com/Samarth-09", w, context);
        } else if (i == 3) {
          globals.launchURL("https://leetcode.com/srparekh0909/", w, context);
        } else if (i == 4) {
          globals.launchURL(
              "https://www.codechef.com/users/samarth0909", w, context);
        } else if (i == 5) {
          globals.launchURL(
              "https://www.hackerrank.com/profile/IT068_Samarth", w, context);
        } else if (i == -1) {
          globals.launchURL(url!, w, context);
        }
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: (w / 100) * 1),
          padding: EdgeInsets.symmetric(
              vertical: (h / 100) * 1, horizontal: (w / 100) * 1.25),
          decoration: BoxDecoration(
              border:
                  Border.all(width: (w / 100) * 0.1, color: globals.blackish),
              color: globals.brownish),
          child: Text(s,
              style: globals.ts((w / 100) * 1.25, globals.transparent, null))),
    );
  }

  Widget contactMeButton(
      double w, double h, String s, Icon i, BuildContext context) {
    return InkWell(
      onTap: () {
        // if (s == 'Email') {}
        if (s == "LinkedIn") {
          globals.launchURL(
              "https://www.linkedin.com/in/samarth-parekh-8948492a8/",
              w,
              context);
        }
      },
      child: Container(
          width: w * 0.3,
          // padding: EdgeInsets.symmetric(horizontal: 20),
          height: h * 0.12,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: globals.greyish,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: ListTile(
              leading: i,
              title: Text(s,
                  textAlign: TextAlign.center,
                  style: globals.ts((w / 100) * 1.5, globals.blackish, null)),
              tileColor: globals.transparent)),
    );
  }
}
