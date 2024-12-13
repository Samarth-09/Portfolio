import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/CommonWidgets/Appbar.dart';
import 'package:portfolio/CommonWidgets/Buttons.dart';
import 'package:portfolio/CommonWidgets/Footer.dart';
import 'package:portfolio/Providers/Home/HomeProvider.dart';
import 'package:portfolio/globals.dart';
import 'package:provider/provider.dart';

// class landing extends StatefulWidget {
//   const landing({super.key});

//   @override
//   State<landing> createState() => _landingState();
// }

// class _landingState extends State<landing> {
//   int idx = 0;
//   @override
//   Widget build(BuildContext context) {
//     double w, h;
//     return LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//       w = constraints.maxWidth;
//       h = constraints.maxHeight;
//       if (constraints.maxWidth > 1200) {
//         return Scaffold(
//             appBar: AppBar(
//               // floating: true,
//               backgroundColor: globals.transparent,
//               surfaceTintColor: globals.transparent,
//               title: Image.asset('/images/logo.png',
//                   width: (w / 100) * 12,
//                   height: (h / 100) * 7,
//                   fit: BoxFit.fill),
//               actions: [
//                 appBarButton(w, h, "Home", 0),
//                 appBarButton(w, h, "Projects", 1),
//                 appBarButton(w, h, "Skills", 2),
//                 appBarButton(w, h, "Contact Me", 3)
//               ],
//             ),
//             body: SingleChildScrollView(
//               child: SizedBox(
//                 width: w,
//                 height: h,
//                 child: ChangeNotifierProvider(
//                   create: (context) => LandingProvider(),
//                   child: Consumer<LandingProvider>(
//                       builder: (context, value, child) {
//                     // print(value.currentScreen[value.currentIndex] == home);
//                     if (value.currentScreen[value.currentIndex] == home) {
//                       // print(value.currentScreen[value.currentIndex]);
//                       return const home();
//                     } else {
//                       return Container();
//                     }
//                   }),
//                 ),
//               ),
//             ));
//       } else {
//         return Container();
//       }
//     });
//   }

//   Widget appBarButton(double w, double h, String s, int i) {
//     return InkWell(
//       onTap: () {
//         if (i != -1) {
//           idx = i;
//         }
//       },
//       child: Container(
//           margin: EdgeInsets.symmetric(horizontal: (w / 100) * 1),
//           padding: EdgeInsets.symmetric(
//               vertical: (h / 100) * 1, horizontal: (w / 100) * 0.75),
//           decoration: BoxDecoration(
//               border:
//                   Border.all(width: (w / 100) * 0.1, color: globals.blackish),
//               color: globals.transparent),
//           child: Text(s,
//               style: globals.ts((w / 100) * 1.25, globals.blackish, null))),
//     );
//   }
// }

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with SingleTickerProviderStateMixin {
  ScrollController sc = ScrollController();
  Appbar appbar = Appbar();
  Footer footer = Footer();
  Buttons button = Buttons();
  Map<String, dynamic> mp = {
    "p1": {
      // "img": "assets/assets/images/smartdiagnosehub.jpg",
      "img": "images/smartdiagnosehub.jpg",
      "name": "SmartDiagnoseHub",
      "link": "https://github.com/Samarth-09/SmartDaignoseHub"
    },
    "p2": {
      // "img": "assets/assets/images/mymoney.png",
      "img": "images/mymoney.png",
      "name": "MyMoney",
      "link": "https://github.com/Samarth-09/mymoney"
    },
    "p3": {
      // "img": "assets/assets/images/doubtbuddy.png",
      "img": "images/doubtbuddy.png",
      "name": "DoubtBuddy24x7",
      "link": "https://github.com/manav278/DotSlash7.0-DoubtBuddy24x7"
    },
    "p4": {
      // "img": "assets/assets/images/stcportal.png",
      "img": "images/stcportal.png",
      "name": "STC-Portal",
      "link": "https://github.com/Samarth-09/stc_portal"
    },
    "p5": {
      // "img": "assets/assets/images/ngoally.png",
      "img": "images/ngoally.png",
      "name": "NGOAlly",
      "link": "https://github.com/Samarth-09/NGOAlly"
    },
    "p6": {
      // "img": "assets/assets/images/calc.jpeg",
      "img": "images/calc.jpeg",
      "name": "Calculator",
      "link": "https://github.com/Samarth-09/calculator"
    },
  };
  double prev = 0;
  double totalHeight = 0;
  GlobalKey k = GlobalKey();

  List<String> l1 = List.from("FLUTTER+NODE".split(''));
  List<String> l2 = List.from("FULLSTACK".split(''));
  late AnimationController ac;
  late Animation<double> typingAnimation;
  bool isReverse = false;
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   RenderObject ro = k.currentContext!.findRenderObject()!;
    //   if (ro is RenderBox) {
    //     totalHeight = ro.size.height;
    //     print(totalHeight);
    //   }
    // });
    ac = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    // ac.forward();
    ac.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ac.repeat();
      }
      // AnimationStatus.reverse
    });
    typingAnimation = Tween<double>(begin: 0, end: 18)
        .animate(CurvedAnimation(parent: ac, curve: Curves.linear));
    // oc = AnimationController(
    //     vsync: this, duration: const Duration(milliseconds: 236));
    // oc.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     oc.repeat();
    //   }
    // });
    // opacityAnimation = Tween<double>(begin: 0, end: 1).animate(oc);
  }

  @override
  Widget build(BuildContext context) {
    double w, h;
    // int c = 0;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      w = constraints.maxWidth;
      h = constraints.maxHeight;
      // List<Widget> wi1 = List.generate(
      //     l1.length,
      //     (index) => Container(
      //         // alignment: Alignment.center,
      //         padding: EdgeInsets.symmetric(horizontal: 5),
      //         margin: EdgeInsets.only(bottom: (h / 100) * 0.8),
      //         decoration: BoxDecoration(
      //             border: Border.all(color: globals.blackish),
      //             color: globals.greyish,
      //             borderRadius: BorderRadius.circular(5)),
      //         child: Text(
      //           l1[index],
      //           textAlign: TextAlign.center,
      //           style: globals.ts(
      //               (w / 100) * 1.15, globals.blackish, FontWeight.bold),
      //         )));
      // List<Widget> wi2 = List.generate(
      //     l2.length,
      //     (index) => Container(
      //         padding: EdgeInsets.symmetric(horizontal: 5),
      //         margin: EdgeInsets.only(bottom: (h / 100) * 0.8),
      //         decoration: BoxDecoration(
      //             border: Border.all(color: globals.blackish),
      //             color: globals.greyish,
      //             borderRadius: BorderRadius.circular(5)),
      //         child: Text(
      //           l2[index],
      //           textAlign: TextAlign.center,
      //           style: globals.ts(
      //               (w / 100) * 1.15, globals.blackish, FontWeight.bold),
      //         )));
      if (constraints.maxWidth > 1200) {
        return Scaffold(
          key: k,
          appBar: appbar.appbar(w, h, context),
          body: Container(
              width: w,
              height: h,
              color: Colors.white,
              child: SingleChildScrollView(
                  // key: k,
                  controller: sc,
                  child: Column(children: [
                    SizedBox(
                      // key: k,
                      width: w,
                      height: h * 0.95,
                      child: Stack(
                        // key: k,
                        children: [
                          Positioned(
                            top: -(w * 0.1),
                            left: -(w * 0.065),
                            child: Transform(
                              origin: Offset(w * 0.3, h * 0.45),
                              transform: Matrix4.rotationZ(45),
                              child: Container(
                                width: w * 3,
                                height: h * 3,
                                decoration: BoxDecoration(
                                    color: globals.brownish,
                                    border: Border.all(
                                        color: globals.brownish,
                                        width: (w / 100) * 1)),
                              ),
                            ),
                          ),

                          Positioned(
                              left: (w / 100) * 5.5,
                              top: (h / 100) * 5,
                              child: TweenAnimationBuilder(
                                  curve: Curves.ease,
                                  tween: Tween<double>(begin: 0, end: 1),
                                  duration: const Duration(seconds: 2),
                                  builder: (context, value, child) {
                                    return Container(
                                      alignment: Alignment.center,
                                      width: w * 0.35,
                                      height: h * 0.82,
                                      decoration: BoxDecoration(
                                          color: globals.transparent,
                                          border: Border.all(
                                              color: globals.greyish,
                                              width: (w / 100) * 0.6),
                                          borderRadius: BorderRadius.circular(
                                              (w / 100) * 2)),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: w * 0.31,
                                        height: h * 0.75,
                                        decoration: BoxDecoration(
                                            color: globals.transparent,
                                            border: Border.all(
                                                color: globals.greyish,
                                                width: (w / 100) * 0.2),
                                            borderRadius: BorderRadius.circular(
                                                (w / 100) * 2)),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              (w / 100) * 2),
                                          child: Opacity(
                                            opacity: value,
                                            child: Image.asset(
                                              "./images/Photo.jpg",
                                              width: w * 0.28 * value,
                                              height: h * 0.71 * value,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  })),

                          // Positioned(
                          //   left: (w / 100) * 5.5,
                          //   top: (h / 100) * 5,
                          //   child: TweenAnimationBuilder(
                          //       duration: const Duration(milliseconds: 1500),
                          //       tween: Tween<double>(begin: 0, end: 1),
                          //       builder: (context, value, child) {
                          //         return Opacity(
                          //           opacity: value,
                          //           child: Container(
                          //               width: w * 0.35,
                          //               height: h * 0.82,
                          //               decoration: BoxDecoration(
                          //                   color: globals.transparent,
                          //                   border: Border.all(
                          //                       color: globals.greyish,
                          //                       width: (w / 100) * 0.6),
                          //                   borderRadius: BorderRadius.circular(
                          //                       (w / 100) * 1))),
                          //         );
                          //       }),
                          // ),
                          // Positioned(
                          //   left: (w / 100) * 6.8,
                          //   top: (h / 100) * 7.6,
                          //   child: TweenAnimationBuilder(
                          //       duration: const Duration(milliseconds: 1500),
                          //       tween: Tween<double>(begin: 0, end: 1),
                          //       builder: (context, value, child) {
                          //         return Opacity(
                          //           opacity: value,
                          //           child: Container(
                          //               width: w * 0.325,
                          //               height: h * 0.76,
                          //               decoration: BoxDecoration(
                          //                   color: globals.transparent,
                          //                   border: Border.all(
                          //                       color: globals.greyish,
                          //                       width: (w / 100) * 0.2),
                          //                   borderRadius: BorderRadius.circular(
                          //                       (w / 100) * 1))),
                          //         );
                          //       }),
                          // ),

                          // Positioned(
                          //     left: (w / 100) * 8,
                          //     top: (h / 100) * 10,
                          //     child: TweenAnimationBuilder(
                          //         duration: const Duration(milliseconds: 1500),
                          //         tween: Tween<double>(begin: 0, end: 1),
                          //         builder: (context, value, child) {
                          //           return Opacity(
                          //             opacity: value,
                          //             child: ClipRRect(
                          //                 clipBehavior: Clip.antiAlias,
                          //                 borderRadius: BorderRadius.circular(
                          //                     (w / 100) * 1),
                          //                 child: Image.asset("images/photo.jpg",
                          //                     width: w * 0.3,
                          //                     height: h * 0.72,
                          //                     fit: BoxFit.fill)),
                          //           );
                          //         })),

                          // TweenAnimationBuilder(
                          //   curve: Curves.easeIn,
                          //   tween: Tween<double>(begin: 0, end: 1),
                          //   duration: const Duration(milliseconds: 1500),
                          //   builder: (context, value, child) {
                          //     return Positioned(
                          //       left: (w / 100) * 6 * value,
                          //       top: (h / 100) * 66,
                          //       child: Opacity(
                          //         opacity: value,
                          //         child: Column(
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             Container(
                          //               margin:
                          //                   EdgeInsets.only(top: (h / 100) * 4),
                          //               child: Text(
                          //                 "Hello, I am,",
                          //                 style: globals.ts(
                          //                     (w / 100) * 1.75,
                          //                     globals.blackish,
                          //                     FontWeight.bold),
                          //               )
                          //             ),
                          //             Container(
                          //               margin:
                          //                   EdgeInsets.only(top: (h / 100) * 4),
                          //               child: Text(
                          //                 "SAMARTH R. PAREKH",
                          //                 style: globals.ts(
                          //                     (w / 100) * 2.25,
                          //                     globals.brownish,
                          //                     FontWeight.bold),
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     );
                          //   },
                          // ),
                          // Positioned(
                          //     left: w * 0.45,
                          //     top: (h / 100) * 7,
                          //     child: Container(
                          //       height: h * 0.9,
                          //       width: 20,
                          //       margin: EdgeInsets.only(top: (h / 100) * 2),
                          //       child: ListView(
                          //           scrollDirection: Axis.vertical,
                          //           children: wi1),
                          //     )),
                          // Positioned(
                          //     left: w * 0.55,
                          //     top: (h / 100) * 7,
                          //     child: Container(
                          //       height: h * 0.9,
                          //       // padding: EdgeInsets.symmetric(horizontal: 1),
                          //       width: 20,
                          //       margin: EdgeInsets.only(top: (h / 100) * 2),
                          //       child: ListView(
                          //           scrollDirection: Axis.vertical,
                          //           children: wi2),
                          //     )),

                          // Positioned(
                          //   right: w*0.1,
                          //   height: h*0.2,
                          //   child: AnimatedBuilder(
                          //     animation: typingAnimation,
                          //     builder: (context, child) {
                          //       return Text(
                          //         "SAMARTH R. PAREKH".substring(
                          //             0, typingAnimation.value.toInt()),
                          //         style: globals.ts((w / 100) * 5,
                          //             globals.brownish, FontWeight.bold),
                          //       );
                          //     },
                          //   ),
                          // ),

                          Positioned(
                              top: (h / 100) * 25,
                              right: (w / 100) * 28,
                              // right: (w / 100) * 31,
                              child: Image.asset("./images/c1.png",
                                  width: (w / 100) * 5.5,
                                  height: (h / 100) * 9,
                                  fit: BoxFit.fill)),

                          // Positioned(
                          //     bottom: (h / 100) * 30,
                          //     // left: (w / 100) * 54,
                          //     right: (w / 100) * 30,
                          //     child: Image.asset("./images/c2.png",
                          //         width: (w / 100) * 5.5,
                          //         height: (h / 100) * 9,
                          //         fit: BoxFit.fill)),
                          // Positioned(
                          //     top: (h / 100) * 15,
                          //     left: (w / 100) * 50,
                          //     child: Image.asset("./images/c3.png",
                          //         width: (w / 100) * 5.5,
                          //         height: (h / 100) * 9,
                          //         fit: BoxFit.fill)),
                          // Positioned(
                          //     top: (h / 100) * 5,
                          //     right: (w / 100) * 2,
                          //     child: Image.asset("./images/c4.png",
                          //         width: (w / 100) * 5.5,
                          //         height: (h / 100) * 9,
                          //         fit: BoxFit.fill)),
                          Positioned(
                            right: (w / 100) * 5,
                            top: (h / 100) * 36,
                            child: AnimatedBuilder(
                              animation: typingAnimation,
                              builder: (context, child) {
                                // print(typingAnimation.value);
                                return Opacity(
                                    opacity:
                                        (typingAnimation.value.toInt() % 2 == 0)
                                            ? 0
                                            : 1,
                                    child: Container(
                                        color: globals.brownish,
                                        width: (w / 100) * 0.3,
                                        height: (h / 100) * 8));
                              },
                            ),
                          ),

                          TweenAnimationBuilder(
                              onEnd: () => ac.forward(),
                              curve: Curves.linear,
                              tween: Tween<double>(begin: 0, end: 1),
                              duration: const Duration(milliseconds: 1500),
                              builder: (context, value, child) {
                                return Positioned(
                                  right: (w / 100) * 6 * value,
                                  top: (h / 100) * 22,
                                  child: Opacity(
                                    opacity: value,
                                    child: Container(
                                        margin:
                                            EdgeInsets.only(top: (h / 100) * 4),
                                        child: Text(
                                          "Hello, I'm DEVELOPER:",
                                          style: globals.ts(
                                              (w / 100) * 2,
                                              globals.blackish,
                                              FontWeight.bold),
                                        )),
                                  ),
                                );
                              }),
                          Positioned(
                            right: (w / 100) * 6,
                            top: (h / 100) * 35,
                            child: AnimatedBuilder(
                              animation: typingAnimation,
                              builder: (context, child) {
                                return Text(
                                  "SAMARTH R. PAREKH".substring(
                                      0, typingAnimation.value.toInt()),
                                  style: globals.ts((w / 100) * 3.5,
                                      globals.brownish, FontWeight.bold),
                                );
                              },
                            ),
                          ),

                          TweenAnimationBuilder(
                              curve: Curves.linear,
                              tween: Tween<double>(begin: 0, end: 1),
                              duration: const Duration(milliseconds: 1600),
                              builder: (context, avalue, child) {
                                return Positioned(
                                  right: (w / 100) * 5,
                                  top: (h / 100) * 50 * avalue,
                                  child: ChangeNotifierProvider(
                                      create: (context) => HomeProvider(),
                                      child: Consumer<HomeProvider>(
                                          builder: (context, value, child) {
                                        return Opacity(
                                          opacity: avalue,
                                          child: button.linksButton(
                                              w,
                                              h,
                                              "Download Resume",
                                              6,
                                              context,
                                              value,
                                              "../../assets/images/Resume.pdf"),
                                        );
                                      })),
                                );
                              })

                          // TweenAnimationBuilder(
                          //   curve: Curves.easeIn,
                          //   tween: Tween<double>(begin: 1, end: 17),
                          //   duration: const Duration(seconds: 4),
                          //   builder: (context, value, child) {
                          //     return Positioned(
                          //       right: (w / 100) * 6 * 1,
                          //       top: (h / 100) * 35,
                          //       child: Opacity(
                          //         opacity: 1,
                          //         child: Column(
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             // Container(
                          //             //     margin: EdgeInsets.only(
                          //             //         top: (h / 100) * 4),
                          //             //     child: Text(
                          //             //       "Hello, I am,",
                          //             //       style: globals.ts(
                          //             //           (w / 100) * 3,
                          //             //           globals.blackish,
                          //             //           FontWeight.bold),
                          //             //     )),
                          //             Text(
                          //               "SAMARTH R. PAREKH"
                          //                   .substring(0, value.toInt()),
                          //               style: globals.ts((w / 100) * 5,
                          //                   globals.brownish, FontWeight.bold),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     );
                          //   },
                          // ),
                          // TweenAnimationBuilder(
                          //   curve: Curves.easeIn,
                          //   duration: const Duration(milliseconds: 1500),
                          //   tween: Tween<double>(begin: 0, end: 1),
                          //   builder: (BuildContext context, dynamic value,
                          //       Widget? child) {
                          //     return Positioned(
                          //       right: (w / 100) * 6 * value,
                          //       top: (h / 100) * 10,
                          //       child: Opacity(
                          //         opacity: value,
                          //         child: Stack(children: [
                          //           Image.asset(
                          //             "/images/home1.png",
                          //             width: w * 0.3,
                          //             height: h * 0.7,
                          //             fit: BoxFit.fill,
                          //           ),
                          //           Positioned(
                          //               right: (w / 100) * 2,
                          //               top: (h / 100) * 12,
                          //               child: Container(
                          //                   padding: EdgeInsets.symmetric(
                          //                       vertical: (h / 100) * 1.25,
                          //                       horizontal: (w / 100) * 1),
                          //                   color: globals.brownish,
                          //                   child: Text("Design",
                          //                       style: globals.ts(
                          //                           (w / 100) * 1.5,
                          //                           Colors.white,
                          //                           FontWeight.bold)))),
                          //           Positioned(
                          //               right: (w / 100) * 11,
                          //               top: (h / 100) * 30,
                          //               child: Container(
                          //                   padding: EdgeInsets.symmetric(
                          //                       vertical: (h / 100) * 1.25,
                          //                       horizontal: (w / 100) * 1),
                          //                   color: globals.brownish,
                          //                   child: Text("Coding",
                          //                       style: globals.ts(
                          //                           (w / 100) * 1.5,
                          //                           Colors.white,
                          //                           FontWeight.bold)))),
                          //           Positioned(
                          //               right: (w / 100) * 18,
                          //               top: (h / 100) * 50,
                          //               child: Container(
                          //                   padding: EdgeInsets.symmetric(
                          //                       vertical: (h / 100) * 1.25,
                          //                       horizontal: (w / 100) * 1),
                          //                   color: globals.brownish,
                          //                   child: Text("Debugging",
                          //                       style: globals.ts(
                          //                           (w / 100) * 1.5,
                          //                           Colors.white,
                          //                           FontWeight.bold))))
                          //         ]),
                          //       ),
                          //     );
                          //   },
                          // )
                        ],
                      ),
                    ),
                    Container(
                        color: globals.transparent,
                        margin: EdgeInsets.only(top: (h / 100) * 10),
                        width: w,
                        // height: h * 0.8,
                        // padding: EdgeInsets.symmetric(horizontal: w*0.1),
                        child: ChangeNotifierProvider(
                            create: (context) => HomeProvider(),
                            child: Consumer<HomeProvider>(
                                builder: (context, value, child) {
                              sc.addListener(() {
                                if ((sc.position.pixels) >= 200) {
                                  value.x = 1;
                                  value.changeVisibility();
                                  // print(sc.position.pixels);
                                }
                              });

                              return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                            width: w * 0.4,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        top: (h / 100) * 2),
                                                    child: Text(
                                                      "About Me",
                                                      style: globals.ts(
                                                          (w / 100) * 1.35,
                                                          globals.brownish,
                                                          FontWeight.bold),
                                                    )),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        top: (h / 100) * 1),
                                                    child: Divider(
                                                        color: globals.brownish,
                                                        thickness: 1)),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: (h / 100) * 3),
                                                  child: Text(
                                                    "Passionate and skilled FULL STACK DEVELOPER with a strong focus on FLUTTER application development. I have an edge on making REST APIs using Node-Express. Problem-solving is the main excitement for me and always open to explore new things. I believe in hard work with smartness and dedication.",
                                                    textAlign:
                                                        TextAlign.justify,
                                                    style: globals
                                                        .ts(
                                                            (w / 100) * 1.3,
                                                            globals.blackish,
                                                            null)
                                                        .copyWith(height: 2),
                                                  ),
                                                ),
                                              ],
                                            ))
                                        .animate(target: value.x)
                                        .slideX(
                                            duration: const Duration(
                                                milliseconds: 1500),
                                            begin: -1,
                                            end: 0),
                                    Image.asset("/images/home4.png",
                                        fit: BoxFit.fill,
                                        width: w * 0.4,
                                        height: h * 0.7)
                                  ]);
                            }))),
                    ChangeNotifierProvider(
                      create: (context) => HomeProvider(),
                      child: Consumer<HomeProvider>(
                          builder: (context, value, child) {
                        sc.addListener(() {
                          if ((sc.position.pixels).floor() >= 550) {
                            value.x = 1;
                            value.changeVisibility();
                            // print('1 ${c++}');
                            // print(sc.position.pixels);
                          }
                        });

                        return Container(
                            // padding: EdgeInsets.symmetric(horizontal: w),
                            margin: EdgeInsets.only(top: (h / 100) * 6),
                            width: w * 0.9,
                            child:
                                Divider(color: globals.greyish, thickness: 1.5)
                                    .animate(target: value.x)
                                    .fadeIn(
                                        curve: Curves.easeIn,
                                        duration: const Duration(seconds: 1),
                                        begin: 0));
                      }),
                    ),
                    ChangeNotifierProvider(
                      create: (context) => HomeProvider(),
                      child: Consumer<HomeProvider>(
                          builder: (context, value, child) {
                        sc.addListener(() {
                          if ((sc.position.pixels).floor() >= 550) {
                            value.x = 1;
                            value.changeVisibility();
                            // print('2 ${c++}');
                          }
                        });

                        return Container(
                                width: w * 0.9,
                                margin: EdgeInsets.only(top: (h / 100) * 1.5),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ChangeNotifierProvider(
                                        create: (context) => HomeProvider(),
                                        child: Consumer<HomeProvider>(
                                            builder: (context, value, child) {
                                          return button.linksButton(w, h,
                                              "LinkedIn", 1, context, value);
                                        }),
                                      ),
                                      ChangeNotifierProvider(
                                        create: (context) => HomeProvider(),
                                        child: Consumer<HomeProvider>(
                                            builder: (context, value, child) {
                                          return button.linksButton(w, h,
                                              "GitHub", 2, context, value);
                                        }),
                                      ),
                                      ChangeNotifierProvider(
                                        create: (context) => HomeProvider(),
                                        child: Consumer<HomeProvider>(
                                            builder: (context, value, child) {
                                          return button.linksButton(w, h,
                                              "LeetCode", 3, context, value);
                                        }),
                                      ),
                                      ChangeNotifierProvider(
                                        create: (context) => HomeProvider(),
                                        child: Consumer<HomeProvider>(
                                            builder: (context, value, child) {
                                          return button.linksButton(w, h,
                                              "CodeChef", 4, context, value);
                                        }),
                                      ),
                                      ChangeNotifierProvider(
                                        create: (context) => HomeProvider(),
                                        child: Consumer<HomeProvider>(
                                            builder: (context, value, child) {
                                          return button.linksButton(w, h,
                                              "HakerRank", 5, context, value);
                                        }),
                                      ),
                                    ]))
                            .animate(target: value.x)
                            .slideX(
                                curve: Curves.easeIn,
                                duration: const Duration(milliseconds: 1500),
                                begin: 2,
                                end: 0)
                            .fadeIn(
                                curve: Curves.easeIn,
                                duration: const Duration(milliseconds: 1500),
                                begin: 0);
                      }),
                    ),
                    ChangeNotifierProvider(
                      create: (context) => HomeProvider(),
                      child: Consumer<HomeProvider>(
                          builder: (context, value, child) {
                        sc.addListener(() {
                          if ((sc.position.pixels).floor() >= 550) {
                            value.x = 1;
                            value.changeVisibility();
                            // print('1 ${c++}');
                          }
                        });

                        return Container(
                            // padding: EdgeInsets.symmetric(horizontal: w),
                            margin: EdgeInsets.only(top: (h / 100) * 2),
                            width: w * 0.9,
                            child:
                                Divider(color: globals.greyish, thickness: 1.5)
                                    .animate(target: value.x)
                                    .fadeIn(
                                        curve: Curves.easeIn,
                                        duration: const Duration(seconds: 1),
                                        begin: 0));
                      }),
                    ),
                    Container(
                        color: globals.greyish,
                        margin: EdgeInsets.only(top: (h / 100) * 8),
                        width: w,
                        // height: h * 0.8,
                        // padding: EdgeInsets.symmetric(horizontal: w*0.1),
                        child: ChangeNotifierProvider(
                            create: (context) => HomeProvider(),
                            child: Consumer<HomeProvider>(
                                builder: (context, value, child) {
                              sc.addListener(() {
                                if ((sc.position.pixels) >= 900) {
                                  value.x = 1;
                                  value.changeVisibility();
                                  // print(sc.position.pixels);
                                }
                              });

                              return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset("/images/home3.png",
                                        fit: BoxFit.fill,
                                        width: w * 0.4,
                                        height: h * 0.7),
                                    SizedBox(
                                            width: w * 0.4,
                                            // height: ,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: (h / 100) * 2),
                                                  child: Text(
                                                      "\"Code is like humor. When you have to explain it, it’s bad.\"",
                                                      // textAlign: TextAlign.center,
                                                      style: globals
                                                          .ts(
                                                              (w / 100) * 1.75,
                                                              globals.brownish,
                                                              null)
                                                          .copyWith(
                                                              // color: globals.brownish,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic)),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: (h / 100) * 5),
                                                  child: Text(
                                                      "Solved 250+ problems, Highest Rating of 1553, 5248/21263 of global rank in Weekly Contest 364 and 65 days of Max Streak on LeetCode",
                                                      style: globals.ts(
                                                          (w / 100) * 1.25,
                                                          globals.blackish,
                                                          null)),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        top: (h / 100) * 1.5),
                                                    child: Divider(
                                                        color: globals.brownish,
                                                        thickness: 1)),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: (h / 100) * 1.5),
                                                  child: Text(
                                                      "2 star, Highest Rating of 1441 and 1315/15831 of global rank in August Long 2022 Contest on CodeChef",
                                                      style: globals.ts(
                                                          (w / 100) * 1.25,
                                                          globals.blackish,
                                                          null)),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        top: (h / 100) * 1.5),
                                                    child: Divider(
                                                        color: globals.brownish,
                                                        thickness: 1)),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: (h / 100) * 1.5),
                                                  child: Text(
                                                      "5 star in Problem Solving on HackerRank",
                                                      style: globals.ts(
                                                          (w / 100) * 1.25,
                                                          globals.blackish,
                                                          null)),
                                                ),
                                              ],
                                            ))
                                        .animate(target: value.x)
                                        .slideX(
                                            duration: const Duration(
                                                milliseconds: 1500),
                                            begin: 2,
                                            end: 0)
                                  ]);
                            }))),
                    // ChangeNotifierProvider(
                    //     create: (context) => HomeProvider(),
                    //     child: Consumer<HomeProvider>(
                    //         builder: (context, value, child) {
                    //       sc.addListener(() {
                    //         if ((sc.position.pixels * 100 / totalHeight)
                    //                 .floor() >=
                    //             43) {
                    //           value.x = 1;
                    //           value.changeVisibility();
                    //           // print(sc.position.pixels);
                    //         }
                    //       });

                    //       return Container(
                    //               width: w * 0.9,
                    //               margin: EdgeInsets.only(top: (h / 100) * 8),
                    //               child: Text(
                    //                   "\"Networking is not just about connecting people. It's about connecting possibilities, potential. It's the intricate web that weaves success.\"",
                    //                   textAlign: TextAlign.center,
                    //                   style: globals
                    //                       .ts((w / 100) * 1.75,
                    //                           globals.blackish, null)
                    //                       .copyWith(
                    //                           fontStyle: FontStyle.italic)))
                    //           .animate(target: value.x)
                    //           .fade(
                    //               duration: const Duration(milliseconds: 2000),
                    //               begin: 0)
                    //           .scaleXY(
                    //               curve: Curves.easeIn,
                    //               duration: const Duration(milliseconds: 1500),
                    //               begin: 0,
                    //               end: 1);
                    //       // sc.removeListener(() { });
                    //     })),
                    // ChangeNotifierProvider(
                    //     create: (context) => HomeProvider(),
                    //     child: Consumer<HomeProvider>(
                    //         builder: (context, value, child) {
                    //       sc.addListener(() {
                    //         if (sc.position.pixels >= 300) {
                    //           value.x = 1;
                    //           value.changeVisibility();
                    //           // print(sc.position.pixels);
                    //         }
                    //       });

                    //       return Container(
                    //         margin: EdgeInsets.only(top: (h / 100) * 4),
                    //         child: Image.asset("/images/home2.png",
                    //                 width: w * 0.8,
                    //                 height: h * 0.55,
                    //                 fit: BoxFit.fill)
                    //             .animate(target: value.x)
                    //             .fade(
                    //                 duration: const Duration(seconds: 2),
                    //                 begin: 0)
                    //             .scaleXY(
                    //                 curve: Curves.easeIn,
                    //                 duration:
                    //                     const Duration(milliseconds: 1500),
                    //                 begin: 0,
                    //                 end: 1),
                    //       );
                    //       // sc.removeListener(() { });
                    //     })),
                    ChangeNotifierProvider(
                        create: (context) => HomeProvider(),
                        child: Consumer<HomeProvider>(
                            builder: (context, value, child) {
                          sc.addListener(() {
                            if ((sc.position.pixels) >= 1300) {
                              value.x = 1;
                              value.changeVisibility();
                              // print(sc.position.pixels);
                            }
                          });

                          return Container(
                                  width: w * 0.9,
                                  margin: EdgeInsets.only(top: (h / 100) * 6),
                                  child: Text("Projects",
                                      style: globals.ts((w / 100) * 2,
                                          globals.blackish, null)))
                              .animate(target: value.x)
                              .fade(
                                  curve: Curves.easeIn,
                                  duration: const Duration(seconds: 2),
                                  begin: 0)
                              .slideX(
                                  curve: Curves.easeIn,
                                  duration: const Duration(milliseconds: 1500),
                                  begin: -1,
                                  end: 0);
                          // sc.removeListener(() { });
                        })),

                    ChangeNotifierProvider(
                        create: (context) => HomeProvider(),
                        child: Consumer<HomeProvider>(
                            builder: (context, value, child) {
                          sc.addListener(() {
                            if (sc.position.pixels >= 1300) {
                              value.x = 1;
                              value.changeVisibility();
                              // print(sc.position.pixels);
                            }
                          });

                          return Container(
                              width: w * 0.9,
                              margin: EdgeInsets.only(top: (h / 100) * 6),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ChangeNotifierProvider(
                                        create: (context) => HomeProvider(),
                                        child: Consumer<HomeProvider>(
                                            builder: (context, value, child) {
                                          return projectCard(w, h, "p1", value);
                                        })),
                                    ChangeNotifierProvider(
                                        create: (context) => HomeProvider(),
                                        child: Consumer<HomeProvider>(
                                            builder: (context, value, child) {
                                          return projectCard(w, h, "p2", value);
                                        })),
                                    ChangeNotifierProvider(
                                        create: (context) => HomeProvider(),
                                        child: Consumer<HomeProvider>(
                                            builder: (context, value, child) {
                                          return projectCard(w, h, "p3", value);
                                        }))
                                  ],
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: (h / 100) * 6),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ChangeNotifierProvider(
                                            create: (context) => HomeProvider(),
                                            child: Consumer<HomeProvider>(
                                                builder:
                                                    (context, value, child) {
                                              return projectCard(
                                                  w, h, "p4", value);
                                            })),
                                        ChangeNotifierProvider(
                                            create: (context) => HomeProvider(),
                                            child: Consumer<HomeProvider>(
                                                builder:
                                                    (context, value, child) {
                                              return projectCard(
                                                  w, h, "p5", value);
                                            })),
                                        ChangeNotifierProvider(
                                            create: (context) => HomeProvider(),
                                            child: Consumer<HomeProvider>(
                                                builder:
                                                    (context, value, child) {
                                              return projectCard(
                                                  w, h, "p6", value);
                                            }))
                                      ],
                                    ))
                              ])
                                  .animate(target: value.x)
                                  .fade(
                                      curve: Curves.easeIn,
                                      duration: const Duration(seconds: 2),
                                      begin: 0)
                                  .slideX(
                                      curve: Curves.easeIn,
                                      duration:
                                          const Duration(milliseconds: 1500),
                                      begin: -1,
                                      end: 0));
                        })),
                    footer.footer(w, h, context)
                  ]))),
        );
      } else {
        return Container();
      }
    });
  }

  Widget projectCard(double w, double h, String s, HomeProvider hp) {
    return Container(
      width: w * 0.2,
      padding: EdgeInsets.only(bottom: (h / 100) * 2),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: globals.blackish.withAlpha(80), // Shadow color
              spreadRadius: 3, // Spread radius
              blurRadius: 3, // Blur radius
              offset: Offset(0, 5), // Offset
            ),
          ],
          border:
              Border.all(color: globals.blackish.withAlpha(200), width: 1.5),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.asset(
          mp[s]['img'],
          width: w * 0.2,
          height: h * 0.2,
          fit: BoxFit.fill,
        ),
        Container(
          margin: EdgeInsets.only(top: (h / 100) * 1.5),
          padding: const EdgeInsets.all(10),
          child: Text(
            mp[s]['name'],
            style:
                globals.ts((w / 100) * 1.5, globals.blackish, FontWeight.bold),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: (h / 100) * 1.5),
            child: button.linksButton(
                w, h, "See Code", -1, context, hp, mp[s]['link']))
      ]),
    );
  }
}
