import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ott/home.dart';
import 'package:ott/text.dart';

class TrendingMovies extends StatelessWidget {
  TrendingMovies({
    Key? key,
    required this.Trending,
  }) : super(key: key);

  final List<dynamic> Trending;

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
                "TRENDING",
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
              // padding: EdgeInsets.all(10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TrendingInfo(tinfo: Trending, Ix: index)));
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
                                          Trending[index]['poster_path']))),
                        ),
                        Center(
                          child: ModifiedText(
                              // ignore: prefer_if_null_operators
                              text: Trending[index]['original_title'] != null
                                  ? Trending[index]['original_title'].toString()
                                  : 'loading....',
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
                            Text(Trending[index]['popularity'] != null
                                ? Trending[index]['popularity'].toString()
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
                            Text(Trending[index]['vote_average'] != null
                                ? Trending[index]['vote_average'].toString()
                                : 'loading'),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: Trending.length,
            ),
          ),
        ],
      ),
    );
  }
}

class TrendingInfo extends StatelessWidget {
  TrendingInfo({super.key, required this.tinfo, required this.Ix});

  List<dynamic> tinfo = [];
  int Ix;
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
                                      tinfo[Ix]['poster_path']))),
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
                          tinfo[Ix]['name'] != null
                              ? tinfo[Ix]['name']
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
                              tinfo[Ix]['popularity'] != null
                                  ? tinfo[Ix]['popularity'].toString()
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
                              tinfo[Ix]['original_language'] != null
                                  ? tinfo[Ix]['original_language'].toString()
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
                              tinfo[Ix]['vote_count'] != null
                                  ? tinfo[Ix]['vote_count'].toString()
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
                              tinfo[Ix]['vote_average'] != null
                                  ? tinfo[Ix]['vote_average'].toString()
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
                      tinfo[Ix]['overview'] != null
                          ? tinfo[Ix]['overview'].toString()
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
                    Text("TRENDING",
                        style: TextStyle(color: Colors.red, fontSize: 10.sp)),
                    // Container(
                    //   width: 300.w,
                    //   height: 150.h,
                    //   decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //           image: NetworkImage(
                    //               'http://image.tmdb.org/t/p/w500' +
                    //                   tinfo[Index]['backdrop_path']))),
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
                                  builder: (context) => TrendingInfo(
                                        tinfo: tinfo,
                                        Ix: index,
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
                                                tinfo[index]['poster_path']))),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  tinfo[index]['name'] != null
                                      ? tinfo[index]['name'].toString()
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
                                  Text(tinfo[index]['popularity'] != null
                                      ? tinfo[index]['popularity'].toString()
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
                                  Text(tinfo[index]['vote_average'] != null
                                      ? tinfo[index]['vote_average'].toString()
                                      : 'loading'),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: tinfo.length,
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

// extension padding on num {
//   SizedBox get ph => SizedBox(
//         height: toDouble(),
//       );
//   SizedBox get pw => SizedBox(
//         width: toDouble(),
//       );
// }
