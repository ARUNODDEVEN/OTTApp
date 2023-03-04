import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ott/home.dart';
import 'package:ott/text.dart';
import 'trending.dart';

class topratedMovies extends StatelessWidget {
  topratedMovies({
    Key? key,
    required this.toprated,
  }) : super(key: key);

  // final Map<dynamic> toprated;
  final List<dynamic> toprated;
  bool hover = false;

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
                "TOPRATED",
                style: TextStyle(
                  letterSpacing: 3,
                  fontSize: 10.sp,
                ),
              ),
              Text(
                "Movies",
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
              itemCount: toprated.length,

              // padding: EdgeInsets.all(10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  // radius: 10.0,
                  // hoverColor: Colors.black,
                  // onHover: (value) {
                  //   hover = !hover;
                  // },
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
                                          toprated[index]['poster_path']))),
                        ),
                        Center(
                          child:
                              // ignore: prefer_if_null_operators
                              Text(
                            toprated[index]['original_title'] != null
                                ? toprated[index]['original_title'].toString()
                                : 'loading',
                            style:
                                TextStyle(color: Colors.white, fontSize: 9.sp),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Popularity",
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(toprated[index]['popularity'] != null
                                ? toprated[index]['popularity'].toString()
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
                            Text(toprated[index]['vote_average'] != null
                                ? toprated[index]['vote_average'].toString()
                                : 'loading'),
                          ],
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    // Navigator.of(context).pushNamed('');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Topratedinfo(
                                index_of_trending: index,
                                topratedinfo: toprated)));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Topratedinfo extends StatelessWidget {
  Topratedinfo(
      {super.key, required this.index_of_trending, required this.topratedinfo});

  List<dynamic> topratedinfo = [];
  int index_of_trending;

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
                                      topratedinfo[index_of_trending]
                                          ['poster_path']))),
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
                          topratedinfo[index_of_trending]['original_title'] !=
                                  null
                              ? topratedinfo[index_of_trending]
                                  ['original_title']
                              : ".........",
                          style: TextStyle(
                            fontSize: 13.sp,
                          ),
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
                              topratedinfo[index_of_trending]['popularity'] !=
                                      null
                                  ? topratedinfo[index_of_trending]
                                          ['popularity']
                                      .toString()
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
                              topratedinfo[index_of_trending]
                                          ['original_language'] !=
                                      null
                                  ? topratedinfo[index_of_trending]
                                          ['original_language']
                                      .toString()
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
                              topratedinfo[index_of_trending]['vote_count'] !=
                                      null
                                  ? topratedinfo[index_of_trending]
                                          ['vote_count']
                                      .toString()
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
                              topratedinfo[index_of_trending]['vote_average'] !=
                                      null
                                  ? topratedinfo[index_of_trending]
                                          ['vote_average']
                                      .toString()
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
                      topratedinfo[index_of_trending]['overview'] != null
                          ? topratedinfo[index_of_trending]['overview']
                              .toString()
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
                    Text("TOPRATED",
                        style: TextStyle(color: Colors.red, fontSize: 10.sp)),
                    // Container(
                    //   width: 300.w,
                    //   height: 150.h,
                    //   decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //           image: NetworkImage(
                    //               'http://image.tmdb.org/t/p/w500' +
                    //                   topratedinfo[Index]['backdrop_path']))),
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
                                  builder: (context) => Topratedinfo(
                                      index_of_trending: index,
                                      topratedinfo: topratedinfo)));
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
                                                topratedinfo[index]
                                                    ['poster_path']))),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  topratedinfo[index]['original_title'] != null
                                      ? topratedinfo[index]['original_title']
                                          .toString()
                                      : 'loading',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10.sp),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Popularity",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  Text(topratedinfo[index]['popularity'] != null
                                      ? topratedinfo[index]['popularity']
                                          .toString()
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
                                  Text(topratedinfo[index]['vote_average'] !=
                                          null
                                      ? topratedinfo[index]['vote_average']
                                          .toString()
                                      : 'loading'),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: topratedinfo.length,
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
