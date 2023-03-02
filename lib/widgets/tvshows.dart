import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ott/home.dart';
import 'package:ott/text.dart';

class tv extends StatelessWidget {
  tv({
    Key? key,
    required this.tvshow,
  }) : super(key: key);

  final List<dynamic> tvshow;

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              Text(
                "TV",
                style: TextStyle(
                  letterSpacing: 3,
                  fontSize: 10.sp,
                ),
              ),
              Text(
                "Shows",
                style: TextStyle(
                    letterSpacing: 3, fontSize: 10.sp, color: Colors.red),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 270.h,
            child: ListView.builder(
              // padding: EdgeInsets.all(10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tvshowsdetails(
                                  shows: tvshow,
                                  Index: index,
                                )));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 140.w,
                    height: 270.h,
                    child: Column(
                      children: [
                        Container(
                          height: 190.h,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500' +
                                          tvshow[index]['poster_path']))),
                        ),
                        Center(
                          child: ModifiedText(
                              // ignore: prefer_if_null_operators
                              text: tvshow[index]['name'] != null
                                  ? tvshow[index]['name'].toString()
                                  : 'loading',
                              coloor: Colors.white,
                              size: 9.sp),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Popularity",
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(tvshow[index]['popularity'] != null
                                ? tvshow[index]['popularity'].toString()
                                : 'loading'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Votes",
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(tvshow[index]['vote_average'] != null
                                ? tvshow[index]['vote_average'].toString()
                                : 'loading'),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: tvshow.length,
            ),
          ),
        ],
      ),
    );
  }
}

class tvshowsdetails extends StatelessWidget {
  tvshowsdetails({super.key, required this.shows, required this.Index});
  List<dynamic> shows = [];
  int Index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                      // Navigator.of(context.M)
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.red,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 190.h,
                      // width: MediaQuery.of(context).size.width,
                      width: 120.w,
                      // color: Colors.red,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  'http://image.tmdb.org/t/p/w500' +
                                      shows[Index]['poster_path']))),
                    ),
                    SizedBox(
                      width: 5.h,
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          shows[Index]['name'] != null
                              ? shows[Index]['name']
                              : ".........",
                          style: TextStyle(fontSize: 13.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Wrap(
                          children: [
                            // Text("Popularity")
                            Text(
                              "Popularity  ",
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              shows[Index]['popularity'] != null
                                  ? shows[Index]['popularity'].toString()
                                  : "Loading",
                              style: TextStyle(fontSize: 10.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Wrap(
                          children: [
                            // Text("Popularity")
                            Text(
                              "Original Language  ",
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              shows[Index]['original_language'] != null
                                  ? shows[Index]['original_language'].toString()
                                  : "Loading",
                              style: TextStyle(fontSize: 10.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Wrap(
                          children: [
                            // Text("Popularity")
                            Text(
                              "Vote Count  ",
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              shows[Index]['vote_count'] != null
                                  ? shows[Index]['vote_count'].toString()
                                  : "Loading",
                              style: TextStyle(fontSize: 10.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Wrap(
                          children: [
                            // Text("Popularity")
                            Text(
                              "Average Votes  ",
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              shows[Index]['vote_average'] != null
                                  ? shows[Index]['vote_average'].toString()
                                  : "Loading",
                              style: TextStyle(fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Wrap(
                  children: [
                    // Text("Popularity")
                    Text(
                      "Overview\n",
                      style: TextStyle(color: Colors.red, fontSize: 10.sp),
                    ),

                    Text(
                      shows[Index]['overview'] != null
                          ? shows[Index]['overview'].toString()
                          : "Loading",
                      style: TextStyle(fontSize: 10.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Wrap(
                  children: [
                    // Text("Popularity")
                    Text(
                      "More",
                      style: TextStyle(color: Colors.white, fontSize: 10.sp),
                    ),
                    Text("TVSHOWS",
                        style: TextStyle(color: Colors.red, fontSize: 10.sp)),
                    // Container(
                    //   width: 300.w,
                    //   height: 150.h,
                    //   decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //           image: NetworkImage(
                    //               'http://image.tmdb.org/t/p/w500' +
                    //                   shows[Index]['backdrop_path']))),
                    // )
                  ],
                ),
                Container(
                  height: 270.h,
                  child: ListView.builder(
                    // padding: EdgeInsets.all(10),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => tvshowsdetails(
                                        shows: shows,
                                        Index: index,
                                      )));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 140.w,
                          height: 270.h,
                          child: Column(
                            children: [
                              Container(
                                height: 190.h,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'http://image.tmdb.org/t/p/w500' +
                                                shows[index]['poster_path']))),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  shows[index]['name'] != null
                                      ? shows[index]['name'].toString()
                                      : 'loading',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10.sp),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Popularity",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  Text(shows[index]['popularity'] != null
                                      ? shows[index]['popularity'].toString()
                                      : 'loading'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Votes",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  Text(shows[index]['vote_average'] != null
                                      ? shows[index]['vote_average'].toString()
                                      : 'loading'),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: shows.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
