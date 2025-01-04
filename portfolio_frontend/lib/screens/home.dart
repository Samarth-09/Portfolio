import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/CommonWidgets/Appbar.dart';
import 'package:portfolio/CommonWidgets/Buttons.dart';
import 'package:portfolio/CommonWidgets/Drawer.dart';
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
    "p0": {
      "img": "./assets/images/project/p0/img1.png",
      // "img": "images/project/p0/img1.png",
      "name": "EventPlex",
      "link": "https://github.com/Samarth-09/EventPlex"
    },
    "p1": {
      "img": "./assets/images/smartdiagnosehub.jpg",
      // "img": "images/smartdiagnosehub.jpg",
      "name": "SmartDiagnoseHub",
      "link": "https://github.com/Samarth-09/SmartDaignoseHub"
    },
    "p2": {
      "img": "./assets/images/mymoney.png",
      // "img": "images/mymoney.png",
      "name": "MyMoney",
      "link": "https://github.com/Samarth-09/mymoney"
    },
    "p3": {
      "img": "./assets/images/doubtbuddy.png",
      // "img": "images/doubtbuddy.png",
      "name": "DoubtBuddy24x7",
      "link": "https://github.com/manav278/DotSlash7.0-DoubtBuddy24x7"
    },
    "p4": {
      "img": "./assets/images/stcportal.png",
      // "img": "images/stcportal.png",
      "name": "STC-Portal",
      "link": "https://github.com/Samarth-09/stc_portal"
    },
    "p5": {
      "img": "./assets/images/ngoally.png",
      // "img": "images/ngoally.png",
      "name": "NGOAlly",
      "link": "https://github.com/Samarth-09/NGOAlly"
    },
    "p6": {
      "img": "./assets/images/calc.jpeg",
      // "img": "images/calc.jpeg",
      "name": "Calculator",
      "link": "https://github.com/Samarth-09/calculator"
    },
  };
  double prev = 0;
  double totalHeight = 0;
  GlobalKey k = GlobalKey();
  MyDrawer myDrawer = MyDrawer();

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
                                              "./assets/images/Photo.jpg",
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
                              child: Image.asset("./assets/images/c1.png",
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
                                              "../../assets/assets/images/Resume.pdf"),
                                        );
                                      })),
                                );
                              })
                        ],
                      ),
                    ),
                    Container(
                        color: globals.transparent,
                        margin: EdgeInsets.only(top: (h / 100) * 10),
                        width: w,
                        child: ChangeNotifierProvider(
                            create: (context) => HomeProvider(),
                            child: Consumer<HomeProvider>(
                                builder: (context, value, child) {
                              sc.addListener(() {
                                if ((sc.position.pixels) >= 230) {
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
                                                    "Hello! I’m Samarth Parekh, a passionate Software Developer from Vadodara, dedicated to building value-driven and impactful solutions. With expertise in Flutter and strong knowledge of Node.js, Express, and GraphQL, I thrive on creating efficient and clean-code applications. Currently, I’m working as a .NET Developer, where I’m expanding my skill set while exploring new technologies and methodologies. An avid learner, I’m always excited to embrace new challenges and opportunities to grow as a developer.",
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
                                    Image.asset("./assets/images/home4.png",
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
                          if ((sc.position.pixels).floor() >= 580) {
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
                          if ((sc.position.pixels).floor() >= 580) {
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
                          if ((sc.position.pixels).floor() >= 580) {
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
                                    Image.asset("/assets/images/home3.png",
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
                                                      "--> 350+ DSA problems\n--> 50+ SQL Problems\n-->65 days of Max Streak",
                                                      style: globals.ts(
                                                          (w / 100) * 1.25,
                                                          globals.blackish,
                                                          null)),
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  margin: const EdgeInsets.only(
                                                      top: 5),
                                                  child: Text("...on Leetcode",
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
                                                      "--> 2 star, Highest Rating of 1441\n--> Highest global rank 1315/15831",
                                                      style: globals.ts(
                                                          (w / 100) * 1.25,
                                                          globals.blackish,
                                                          null)),
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  margin: const EdgeInsets.only(
                                                      top: 5),
                                                  child: Text("...on Codechef",
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
                                                      "--> 5 star in Problem Solving",
                                                      style: globals.ts(
                                                          (w / 100) * 1.25,
                                                          globals.blackish,
                                                          null)),
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  margin: const EdgeInsets.only(
                                                      top: 5),
                                                  child: Text(
                                                      "...on HackerRank",
                                                      style: globals.ts(
                                                          (w / 100) * 1.25,
                                                          globals.blackish,
                                                          null)),
                                                )
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
                    ChangeNotifierProvider(
                        create: (context) => HomeProvider(),
                        child: Consumer<HomeProvider>(
                            builder: (context, value, child) {
                          sc.addListener(() {
                            if ((sc.position.pixels) >= 1330) {
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
                                          return projectCard(w, h, "p0", value);
                                        })),
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
                                                  w, h, "p3", value);
                                            })),
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
        List<String> l = [
              "https://img.icons8.com/color/144/linkedin.png",
              "https://img.icons8.com/glyph-neue/64/github.png",
              "https://img.icons8.com/external-tal-revivo-shadow-tal-revivo/48/external-level-up-your-coding-skills-and-quickly-land-a-job-logo-shadow-tal-revivo.png",
              "https://img.icons8.com/color/144/codechef.png",
              // "https://img.icons8.com/fluency/48/instagram-new.png"
            ],
            urls = [
              "https://www.linkedin.com/in/samarth-parekh-8948492a8/",
              "https://github.com/Samarth-09",
              "https://leetcode.com/srparekh0909/",
              "https://www.codechef.com/users/samarth0909",
            ];
        return Scaffold(
            drawer: myDrawer.drawer(w, h, context),
            appBar: appbar.mAppbar(w),
            body: SingleChildScrollView(
                child: Container(
                    // padding: EdgeInsets.symmetric(
                    //   vertical: (h / 100) * 5,
                    //   // horizontal: (w / 100) * 5
                    // ),
                    alignment: Alignment.center,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // height: h,
                            color: globals.whitish,
                            padding:
                                EdgeInsets.symmetric(vertical: (h / 100) * 2),
                            child: Column(
                              children: [
                                TweenAnimationBuilder(
                                    curve: Curves.ease,
                                    tween: Tween<double>(begin: 0, end: 1),
                                    duration:
                                        const Duration(milliseconds: 1500),
                                    builder: (context, value, child) {
                                      return Container(
                                        alignment: Alignment.center,
                                        width: w * 0.65,
                                        height: h * 0.4,
                                        decoration: BoxDecoration(
                                            color: globals.transparent,
                                            border: Border.all(
                                                color: globals.brownish,
                                                width: (w / 100) * 1),
                                            borderRadius: BorderRadius.circular(
                                                (w / 100) * 1)),
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: w * 0.6,
                                          height: h * 0.35,
                                          decoration: BoxDecoration(
                                              color: globals.transparent,
                                              border: Border.all(
                                                  color: globals.brownish,
                                                  width: (w / 100) * 1),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      (w / 100) * 2)),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                (w / 100) * 2),
                                            child: Opacity(
                                              opacity: value,
                                              child: Image.asset(
                                                "./assets/images/Photo.jpg",
                                                width: w * 0.55 * value,
                                                height: h * 0.3 * value,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                Container(
                                    margin: EdgeInsets.only(top: (h / 100) * 4),
                                    child: Text(
                                      "Hii, I am,",
                                      style: globals.ts((w / 100) * 4,
                                          globals.blackish, FontWeight.bold),
                                    )),
                                Container(
                                  margin: EdgeInsets.only(top: (h / 100) * 2),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AnimatedBuilder(
                                        animation: typingAnimation,
                                        builder: (context, child) {
                                          ac.forward();
                                          return Text(
                                            "SAMARTH R. PAREKH".substring(0,
                                                typingAnimation.value.toInt()),
                                            style: globals.ts(
                                                (w / 100) * 6,
                                                globals.brownish,
                                                FontWeight.bold),
                                          );
                                        },
                                      ),
                                      AnimatedBuilder(
                                        animation: typingAnimation,
                                        builder: (context, child) {
                                          // print(typingAnimation.value);
                                          return Opacity(
                                              opacity: (typingAnimation.value
                                                              .toInt() %
                                                          2 ==
                                                      0)
                                                  ? 0
                                                  : 1,
                                              child: Container(
                                                  color: globals.brownish,
                                                  width: (w / 100) * 0.6,
                                                  height: (h / 100) * 4));
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: (w / 100) * 10),
                                    margin: EdgeInsets.only(top: (h / 100) * 2),
                                    child: Text(
                                      "Full-Stack Developer. You can have a look on my profiles.",
                                      textAlign: TextAlign.center,
                                      style: globals.ts((w / 100) * 3,
                                          globals.blackish, FontWeight.bold),
                                    )),
                                Container(
                                  margin: EdgeInsets.only(top: (h / 100) * 2),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: (w / 100) * 10),
                                  child: Divider(
                                      thickness: 0.5, color: globals.blackish),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: (h / 100) * 1),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ...List.generate(
                                            l.length,
                                            (idx) => InkWell(
                                                  onTap: () {
                                                    globals.launchURL(
                                                        urls[idx], w, context);
                                                  },
                                                  child: Container(
                                                      // margin: EdgeInsets.only(
                                                      //     right: (w / 100) * 2),
                                                      color:
                                                          globals.transparent,
                                                      child: Image.network(
                                                        l[idx],
                                                        width: (w / 100) * 8,
                                                        // height: (h / 100) * 3,
                                                        fit: BoxFit.contain,
                                                      )),
                                                ))
                                      ]),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: (h / 100) * 1),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: (w / 100) * 10),
                                  child: Divider(
                                      thickness: 0.5, color: globals.blackish),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: (h / 100) * 3),
                                  child: TweenAnimationBuilder(
                                      tween: Tween<double>(begin: 0, end: 1),
                                      duration:
                                          const Duration(milliseconds: 1600),
                                      builder: (context, avalue, child) {
                                        return ChangeNotifierProvider(
                                            create: (context) => HomeProvider(),
                                            child: Consumer<HomeProvider>(
                                                builder:
                                                    (context, value, child) {
                                              return Opacity(
                                                opacity: avalue,
                                                child: button.mlinksButton(
                                                    w,
                                                    h,
                                                    "See my Resume",
                                                    6,
                                                    context,
                                                    // value,
                                                    "../../assets/assets/images/Resume.pdf"),
                                              );
                                            }));
                                      }),
                                )
                              ],
                            ),
                          ),
                          Container(
                              // height: h,
                              color: globals.greyish,
                              padding:
                                  EdgeInsets.symmetric(vertical: (h / 100) * 2),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.only(top: (h / 100) * 2),
                                        child: Text(
                                          "About Me",
                                          style: globals.ts(
                                              (w / 100) * 5,
                                              globals.brownish,
                                              FontWeight.bold),
                                        )),
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: (w / 100) * 4),
                                        margin: EdgeInsets.only(
                                            top: (h / 100) * 0.5),
                                        child: Divider(
                                            color: globals.brownish,
                                            thickness: 0.5)),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: (w / 100) * 4),
                                      margin:
                                          EdgeInsets.only(top: (h / 100) * 2),
                                      child: Text(
                                        "Hello! I’m Samarth Parekh, a passionate Software Developer from Vadodara, dedicated to building value-driven and impactful solutions. With expertise in Flutter and strong knowledge of Node.js, Express, and GraphQL, I thrive on creating efficient and clean-code applications. Currently, I’m working as a .NET Developer, where I’m expanding my skill set while exploring new technologies and methodologies. An avid learner, I’m always excited to embrace new challenges and opportunities to grow as a developer.",
                                        textAlign: TextAlign.justify,
                                        style: globals
                                            .ts((w / 100) * 3.5,
                                                globals.blackish, null)
                                            .copyWith(height: 2),
                                      ),
                                    )
                                  ])),
                          Container(
                              color: globals.whitish,
                              padding:
                                  EdgeInsets.symmetric(vertical: (h / 100) * 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin:
                                          EdgeInsets.only(top: (h / 100) * 2),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Achievements",
                                        style: globals.ts((w / 100) * 5,
                                            globals.brownish, FontWeight.bold),
                                      )),
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: (w / 100) * 4),
                                      margin:
                                          EdgeInsets.only(top: (h / 100) * 0.5),
                                      child: Divider(
                                          color: globals.brownish,
                                          thickness: 0.5)),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: (w / 100) * 4),
                                    margin: EdgeInsets.only(top: (h / 100) * 2),
                                    child: Text(
                                        "--> 350+ DSA problems\n--> 50+ SQL Problems\n-->65 days of Max Streak",
                                        style: globals.ts((w / 100) * 4,
                                            globals.blackish, null)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: (w / 100) * 4),
                                    alignment: Alignment.centerRight,
                                    margin: const EdgeInsets.only(top: 5),
                                    child: Text("...on Leetcode",
                                        style: globals.ts((w / 100) * 3,
                                            globals.blackish, null)),
                                  ),
                                  Container(
                                      margin:
                                          EdgeInsets.only(top: (h / 100) * 1.5),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: (w / 100) * 4),
                                      child: Divider(
                                          color: globals.brownish,
                                          thickness: 1)),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: (w / 100) * 4),
                                    margin:
                                        EdgeInsets.only(top: (h / 100) * 1.5),
                                    child: Text(
                                        "--> 2 star, Highest Rating of 1441\n--> Highest global rank 1315/15831",
                                        style: globals.ts((w / 100) * 4,
                                            globals.blackish, null)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: (w / 100) * 4),
                                    alignment: Alignment.centerRight,
                                    margin: const EdgeInsets.only(top: 5),
                                    child: Text("...on Codechef",
                                        style: globals.ts((w / 100) * 3,
                                            globals.blackish, null)),
                                  ),
                                  Container(
                                      margin:
                                          EdgeInsets.only(top: (h / 100) * 1.5),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: (w / 100) * 4),
                                      child: Divider(
                                          color: globals.brownish,
                                          thickness: 1)),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: (w / 100) * 4),
                                    margin:
                                        EdgeInsets.only(top: (h / 100) * 1.5),
                                    child: Text("--> 5 star in Problem Solving",
                                        style: globals.ts((w / 100) * 4,
                                            globals.blackish, null)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: (w / 100) * 4),
                                    alignment: Alignment.centerRight,
                                    margin: const EdgeInsets.only(top: 5),
                                    child: Text("...on HackerRank",
                                        style: globals.ts((w / 100) * 3,
                                            globals.blackish, null)),
                                  )
                                ],
                              )),
                          Container(
                            // margin: EdgeInsets.only(top: (h / 100) * 2),
                            color: globals.greyish,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      margin:
                                          EdgeInsets.only(top: (h / 100) * 3),
                                      child: Text(
                                        "Projects",
                                        style: globals.ts((w / 100) * 5,
                                            globals.brownish, FontWeight.bold),
                                      )),
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: (w / 100) * 4),
                                      margin:
                                          EdgeInsets.only(top: (h / 100) * 0.5),
                                      child: Divider(
                                          color: globals.brownish,
                                          thickness: 0.5)),
                                  // projectCard(w, h, "p"+idx, hp);
                                  SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                          children: List.generate(6, (idx) {
                                        return mProjectCard(
                                            w, h, "p" + idx.toString());
                                      }))),
                                ]),
                          )
                        ]))));
      }
    });
  }

  Widget projectCard(double w, double h, String s, HomeProvider hp) {
    return Container(
      width: w * 0.2,
      padding: EdgeInsets.only(bottom: (h / 100) * 2),
      decoration: BoxDecoration(
          color: globals.whitish,
          boxShadow: [
            BoxShadow(
              color: globals.blackish.withAlpha(80), // Shadow color
              spreadRadius: 1, // Spread radius
              blurRadius: 1, // Blur radius
              offset: Offset(0, 2), // Offset
            ),
          ],
          // border:
          //     Border.all(color: globals.blackish.withAlpha(200), width: 1.5),
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

  Widget mProjectCard(double w, double h, String s) {
    return InkWell(
      focusColor: null,
      hoverColor: null,
      splashColor: null,
      overlayColor: null,
      highlightColor: null,
      onTap: () {
        globals.launchURL(mp[s]['link'], w, context);
      },
      child: Container(
        margin: EdgeInsets.only(
            left: (w / 100) * 13,
            bottom: (h / 100) * 3,
            top: (h / 100) * 3,
            right: (w / 100) * 2),
        width: w * 0.6,
        padding: EdgeInsets.only(bottom: (w / 100) * 2),
        decoration: BoxDecoration(
            color: globals.whitish,
            boxShadow: [
              BoxShadow(
                color: globals.blackish.withAlpha(80), // Shadow color
                spreadRadius: 1, // Spread radius
                blurRadius: 1, // Blur radius
                offset: Offset(0, 2), // Offset
              ),
            ],
            // border:
            //     Border.all(color: globals.blackish.withAlpha(200), width: 1.5),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            mp[s]['img'],
            width: w * 0.6,
            height: h * 0.15,
            fit: BoxFit.fill,
          ),
          Container(
            margin: EdgeInsets.only(top: (h / 100) * 2),
            padding: const EdgeInsets.all(10),
            child: Text(
              mp[s]['name'],
              style:
                  globals.ts((w / 100) * 5, globals.blackish, FontWeight.bold),
            ),
          )
          // Container(
          //     margin: EdgeInsets.only(top: (h / 100) * 2),
          //     child: button.mlinksButton(
          //         w, h, "See Code", -1, context, mp[s]['link']))
        ]),
      ),
    );
  }
}
