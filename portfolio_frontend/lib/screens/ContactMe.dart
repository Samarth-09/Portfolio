import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/CommonWidgets/Appbar.dart';
import 'package:portfolio/CommonWidgets/Buttons.dart';
import 'package:portfolio/CommonWidgets/Drawer.dart';
import 'package:portfolio/CommonWidgets/Footer.dart';
import 'package:portfolio/Providers/ContactMe/ContactMeProvider.dart';
import 'package:portfolio/globals.dart';
import 'package:provider/provider.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({super.key});

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  Appbar appbar = Appbar();
  Footer footer = Footer();
  Buttons button = Buttons();
  MyDrawer myDrawer = MyDrawer();
  @override
  Widget build(BuildContext context) {
    List<TextEditingController> t =
        List.generate(5, (index) => TextEditingController());
    double w, h;
    return LayoutBuilder(builder: (context, constraints) {
      w = constraints.maxWidth;
      h = constraints.maxHeight;
      if (w > 1200) {
        return Scaffold(
            appBar: appbar.appbar(w, h, context),
            body: Container(
                width: w,
                height: h,
                color: Colors.white,
                child: SingleChildScrollView(
                    child: Column(children: [
                  Container(
                      width: w * 0.9,
                      margin: EdgeInsets.only(top: (h / 100) * 6),
                      child: Text(
                        "Let's Connect.",
                        style: globals.ts(
                            (w / 100) * 3.5, globals.blackish, FontWeight.bold),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: (h / 100) * 1),
                      width: w * 0.9,
                      child: Divider(color: globals.greyish, thickness: 1.5)),
                  Container(
                    margin: EdgeInsets.only(top: (h / 100) * 4),
                    width: w * 0.9,
                    child: Text(
                        "Feel free to connect with me on social media to stay updated on my latest projects, news, and insights. Thank you for considering me. I look forward to hearing from you! \n Your privacy is important to me. Any information shared with me will be kept confidential and used solely for the purpose of responding to your inquiry or request.",
                        textAlign: TextAlign.justify,
                        style: globals
                            .ts((w / 100) * 1.25, globals.blackish,
                                FontWeight.w500)
                            .copyWith(height: 2)),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: (h / 100) * 6),
                      width: w * 0.9,
                      child: Text("Get In Touch",
                          style: globals.ts((w / 100) * 2, globals.blackish,
                              FontWeight.bold))),
                  Container(
                      margin: EdgeInsets.only(top: (h / 100) * 6),
                      width: w * 0.9,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            button.contactMeButton(
                                w,
                                h,
                                "+91 6351837117",
                                Icon(Icons.phone, color: globals.blackish),
                                context),
                            button.contactMeButton(
                                w,
                                h,
                                "srparekh0909@gmail.com",
                                Icon(Icons.email_outlined,
                                    color: globals.blackish),
                                context)
                          ])),
                  // Container(
                  //     margin: EdgeInsets.only(top: (h / 100) * 6),
                  //     width: w * 0.9,
                  //     child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           button.contactMeButton(
                  //               w,
                  //               h,
                  //               "LinkedIn",
                  //               Icon(Icons.mobile_friendly_rounded,
                  //                   color: globals.blackish),
                  //               context),
                  // button.contactMeButton(
                  //     w,
                  //     h,
                  //     "srparekh0909@gmail.com",
                  //     Icon(Icons.email_outlined,
                  //         color: globals.blackish))
                  // ])),
                  Container(
                      margin: EdgeInsets.only(top: (h / 100) * 10),
                      width: w * 0.9,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                child: textFeild(w * 0.4, h * 0.1,
                                    (w / 100) * 1.25, "Name", t[0])),
                            Container(
                                child: textFeild(w * 0.4, h * 0.1,
                                    (w / 100) * 1.25, "Email", t[1]))
                          ])),
                  Container(
                      margin: EdgeInsets.only(top: (h / 100) * 5),
                      width: w * 0.9,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                child: textFeild(w * 0.4, h * 0.1,
                                    (w / 100) * 1.25, "Number", t[2])),
                            Container(
                                child: textFeild(w * 0.4, h * 0.1,
                                    (w / 100) * 1.25, "LinkedIn-ID", t[3]))
                          ])),
                  Container(
                      margin: EdgeInsets.only(top: (h / 100) * 5),
                      child: textFeild(w * 0.83, h * 0.3, (w / 100) * 1.25,
                          "Any FeedBack or suggestion or Message", t[4])),
                  ChangeNotifierProvider(
                    create: (context) => ContactMeProvider(),
                    child: Consumer<ContactMeProvider>(
                        builder: (context, value, child) {
                      return Container(
                        width: w * 0.83,
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onHover: (v) {
                            value.changeHovered(v);
                          },
                          onTap: () {
                            value.sendEmail(t[0].text, t[1].text, t[4].text,
                                t[2].text, t[3].text);
                          },
                          child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.bounceOut,
                              margin: EdgeInsets.only(top: (h / 100) * 5),
                              padding: EdgeInsets.symmetric(
                                  vertical: (h / 100) * 1.5,
                                  horizontal: (w / 100) * 7),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: (value.isHovered)
                                          ? globals.transparent
                                          : globals.blackish),
                                  color: (value.isHovered)
                                      ? globals.brownish
                                      : globals.greyish),
                              child: Text("Send Email",
                                  style: globals.ts(
                                      (w / 100) * 1.3,
                                      (value.isHovered)
                                          ? globals.whitish
                                          : globals.blackish,
                                      FontWeight.bold))),
                        ),
                      );
                    }),
                  ),
                  footer.footer(w, h, context)
                ]))));
      } else {
        return Scaffold(
            appBar: appbar.mAppbar(w),
            drawer: myDrawer.drawer(w, h, context),
            body: Container(
                color: globals.whitish,
                width: w,
                child: SingleChildScrollView(
                    child: Column(children: [
                  Container(
                      margin: EdgeInsets.only(top: (h / 100) * 3),
                      child: Text("Let's Connnect",
                          style: globals.ts((w / 100) * 6, globals.brownish,
                              FontWeight.bold))),
                  Container(
                          // margin: EdgeInsets.only(top: (h / 100) * 1),
                          padding:
                              EdgeInsets.symmetric(horizontal: (w / 100) * 4),
                          child: Divider(color: globals.brownish))
                      .animate()
                      .scaleX(
                          begin: 0,
                          end: 1,
                          duration: const Duration(milliseconds: 700),
                          delay: const Duration(milliseconds: 300)),
                  Container(
                    margin: EdgeInsets.only(top: (h / 100) * 3),
                    padding: EdgeInsets.symmetric(horizontal: (w / 100) * 5),
                    child: Text(
                        "Feel free to connect with me on social media to stay updated on my latest projects, news, and insights. Thank you for considering me. I look forward to hearing from you! \n Your privacy is important to me. Any information shared with me will be kept confidential and used solely for the purpose of responding to your inquiry or request.",
                        textAlign: TextAlign.justify,
                        style: globals
                            .ts((w / 100) * 4, globals.blackish,
                                FontWeight.w500)
                            .copyWith(height: 2)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: (h / 100) * 3),
                    child: Text("Get In Touch",
                        textAlign: TextAlign.justify,
                        style: globals.ts(
                            (w / 100) * 5, globals.blackish, FontWeight.bold)),
                  ),
                  Container(
                      // margin: EdgeInsets.only(top: (h / 100) * 1),
                      padding: EdgeInsets.symmetric(horizontal: (w / 100) * 4),
                      child: Divider(color: globals.brownish)),
                  Container(
                      margin: EdgeInsets.only(top: (h / 100) * 3),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: (w / 100) * 2),
                              child: Text(
                                "+91 6351837117",
                                style: globals.ts(
                                    (w / 100) * 3, globals.blackish, null),
                              ),
                            ),
                            SizedBox(
                                height: h * 0.05,
                                child: VerticalDivider(
                                    color: globals.blackish, thickness: 1)),
                            Container(
                              margin: EdgeInsets.only(left: (w / 100) * 2),
                              child: Text(
                                "srparekh0909@gmail.com",
                                style: globals.ts(
                                    (w / 100) * 3, globals.blackish, null),
                              ),
                            )
                          ])),
                  Container(
                      margin: EdgeInsets.only(top: (h / 100) * 2),
                      child: textFeild(
                          w * 0.8, h * 0.07, (w / 100) * 4, "Name", t[0])),
                  Container(
                      margin: EdgeInsets.only(top: (h / 100) * 2),
                      child: textFeild(
                          w * 0.8, h * 0.07, (w / 100) * 4, "Email", t[1])),
                  Container(
                      margin: EdgeInsets.only(top: (h / 100) * 2),
                      child: textFeild(
                          w * 0.8, h * 0.07, (w / 100) * 4, "Number", t[2])),
                  Container(
                      margin: EdgeInsets.only(top: (h / 100) * 2),
                      child: textFeild(w * 0.8, h * 0.07, (w / 100) * 4,
                          "LinkedIn-ID", t[3])),
                  Container(
                      margin: EdgeInsets.only(top: (h / 100) * 2),
                      child: textFeild(w * 0.8, h * 0.2, (w / 100) * 4,
                          "Any FeedBack or suggestion or Message", t[4])),
                  ChangeNotifierProvider(
                    create: (context) => ContactMeProvider(),
                    child: Consumer<ContactMeProvider>(
                        builder: (context, value, child) {
                      return Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: (w / 100) * 4),
                          margin: EdgeInsets.only(
                              top: (h / 100) * 3, bottom: (h / 100) * 2),
                          child: InkWell(
                            onTap: () {
                              value.sendEmail(t[0].text, t[1].text, t[4].text,
                                  t[2].text, t[3].text);
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: (w / 100) * 3,
                                    vertical: (h / 100) * 1),
                                color: globals.brownish,
                                child: Text("Send Email",
                                    style: globals.ts(
                                        (w / 100) * 4, globals.whitish, null))),
                          ));
                    }),
                  )
                ]))));
      }
    });
  }

  Widget textFeild(
      double w, double h, double fs, String s, TextEditingController t) {
    return SizedBox(
      width: w,
      height: h,
      child: TextFormField(
        controller: t,
        minLines: null,
        maxLines: null,
        expands: true,
        cursorColor: globals.blackish,
        decoration: InputDecoration(
            fillColor: Colors.transparent,
            hintText: s,
            hintStyle: globals.ts(fs, globals.blackish, null),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
                borderSide: BorderSide(color: globals.blackish)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
                borderSide: BorderSide(color: globals.blackish))),
      ),
    );
  }
}
