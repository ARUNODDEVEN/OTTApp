import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Upcomingmovies extends StatelessWidget {
  Upcomingmovies({
    super.key,
    required this.upcoming,
  });

  List<dynamic> upcoming = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: upcoming.length,
        itemBuilder: (context, index) {
          return ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                  height: 250.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage('http://image.tmdb.org/t/p/w500' +
                              upcoming[index]['poster_path'])))),
            ],
          );
        });
  }
}
