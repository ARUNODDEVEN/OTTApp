import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ott/home.dart';

class Years extends StatefulWidget {
  Years({super.key});

  @override
  State<Years> createState() => _YearsState();
}

class _YearsState extends State<Years> {
  bool focus = false;
  List y = [
    1990,  
    1991,
    1992,
    1993,
    1994,
    1995,
    1996,
    1997,
    1998,
    1999,
    2000,
    2001,
    2002,
    2003,
    2004,
    2005,
    2006,
    2007,
    2008,
    2009,
    2010,
    2011,
    2012,
    2013,
    2014,
    2015,
    2016,
    2017,
    2018,
    2019,
    2020,
    2021,
    2022,
    2023
  ];

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Colors.black,
    //   body: ListView.builder(
    //     itemBuilder: (context, index) {
    //       return Container(
    //         height: 50,
    //         width: 50,
    //         color: Color.fromARGB(255, 255, 0, 0),
    //         child: Text(
    //           y[index].toString(),
    //           style: TextStyle(color: Colors.black),
    //         ),
    //       );
    //     },
    //     itemCount: y.length,
    //   ),
    // );
    return Scaffold(

        // backgroundColor: Colors.b,
        backgroundColor: Colors.black,
        body: GridView.builder(
            itemCount: y.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (context, index) {
              return InkWell(
                onHover: (value) {
                  focus = !focus;
                },
                borderRadius: BorderRadius.circular(20),
                hoverColor: Colors.red.withOpacity(0.5),
                // focusColor: Colors.red,
                splashColor: Color.fromARGB(255, 113, 8, 1),
                onTap: () {
                  var a = y[index].toString();
                  print(a);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: Offset(
                              0, 2), // changes the position of the shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                      // color: Colors.white,
                    ),
                    height: 50.h,
                    width: 50.w,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text("Mo")
                          Wrap(
                            children: [
                              Text(
                                "Movies of ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100),
                              ),
                              Text(
                                y[index].toString(),
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w100),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
