import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ott/home.dart';
import 'package:ott/text.dart';
import 'package:ott/widgets/photos.dart';
import 'package:ott/widgets/toprated.dart';
import 'package:ott/widgets/trending.dart';
import 'package:ott/widgets/tvshows.dart';
import 'package:ott/widgets/upcoming.dart';
import 'package:ott/widgets/videos.dart';
import 'package:ott/widgets/videos.dart';
import 'package:ott/widgets/years.dart';

import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //first i make three lists then i will fetch data from api so that i can store that data in in this list
  List trendingmovies = [];
  List topratedmovies = [];
  List populartvshows = [];
  List upcomingmovies = [];
  List discover = [];
  String selectedYear = '2022';
  List<String> years = ['2022', '2021', '2020', '2019', '2018', '2017', '2016'];

  // List photos = [];
  // List id = [101, 102, 103, 104, 105, 106, 107];

  final String apikey = 'e6adc26e073e989b47c97321c7b9f3ca';

  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNmFkYzI2ZTA3M2U5ODliNDdjOTczMjFjN2I5ZjNjYSIsInN1YiI6IjYzZmNhNzRkZTRiNTc2MDA5ZDFiOWI2ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MYCNYrS2_DGYrukeA35sr1mZjBCALXJRXs4CmKfW8eA';

///////////////////////////////////////////////
  @override
  void initState() {
    loadmovies();
    // this is load movies function which is i am using to load the data from the api

    super.initState();
  }

  //in this function i am taking the data which is in map format from the api take care do not use the same name for both map and list names

  loadmovies() async {
    TMDB tmdbwithCustomlogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingresult = await tmdbwithCustomlogs.v3.trending.getTrending();
    Map discoverresults =
        await tmdbwithCustomlogs.v3.search.queryMovies('2023');
    Map topratedresults = await tmdbwithCustomlogs.v3.movies.getTopRated();
    Map populartvresults = await tmdbwithCustomlogs.v3.tv.getTopRated();
    Map upcomingmoviesresults =
        await tmdbwithCustomlogs.v3.movies.getUpcoming();

    // for (int i in id) {
    //   Map photosresults = await tmdbwithCustomlogs.v3.movies.getImages(i);
    //   print(photosresults);
    // }
    // Map photosresults = await tmdbwithCustomlogs.v3.movies.getImages(101);
    // Map Discover = await tmdbwithCustomlogs.v3.movies.getImages(trendingresult['id']['lang']);
    // print(upcomingmoviesresults);

    //
// now i am using set state so that the data i am getting the maps in that map i am using list of reults and then i am storing it in the trendingmoviees and toprated movies

    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresults['results'];
      upcomingmovies = upcomingmoviesresults['results'];
      populartvshows = populartvresults['results'];
      discover = discoverresults['results'];
      // photos = photosresults['posters'];
    });

    print(discover);
  }

  Future<void> _handleRefresh() async {
    await loadmovies(); // Call the function to fetch the data again
  }

////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    Icon(
                      Icons.catching_pokemon_sharp,
                      color: Colors.red,
                      size: 50.sp,
                    ),
                    Wrap(
                      children: [
                        Text(
                          "over",
                          style:
                              TextStyle(letterSpacing: 6, color: Colors.white),
                        ),
                        Text(
                          "THE",
                          style: TextStyle(letterSpacing: 6, color: Colors.red),
                        ),
                        Text(
                          "TOP",
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 6,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Divider(
                      color: Colors.red,
                      height: 5.h,
                    )
                  ],
                ),
              ),
              mytiles("Home", Icons.home, ""),
              mytiles("Trending", Icons.trending_up_rounded, ""),
              // ListTile(
              //   hoverColor: Color.fromARGB(255, 65, 3, 3),
              //   // selectedTileColor: Colors.red,
              //   selected: true,
              //   title: Text(
              //     "Selectbyyears",
              //     style: TextStyle(
              //       fontSize: 10.sp,
              //       color: Colors.white,
              //     ),
              //   ),
              //   leading: Icon(
              //     Icons.category,
              //     color: Colors.red,
              //   ),
              //   onTap: () {
              //     // DropdownButton(items: items, onChanged: onChanged)
              //     DropdownButton<String>(
              //       value: selectedYear,
              //       onChanged: (String? newValue) {
              //         setState(() {
              //           selectedYear = newValue!;
              //         });
              //       },
              //       items: years.map<DropdownMenuItem<String>>((String value) {
              //         return DropdownMenuItem<String>(
              //           value: value,
              //           child: Container(child: ListTile()),
              //         );
              //       }).toList(),
              //     );
              //   },
              // ),
              ListTile(
                hoverColor: Color.fromARGB(255, 43, 43, 43),
                // selectedTileColor: Colors.red,
                selected: true,
                title: Text(
                  'Years',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.white,
                  ),
                ),
                leading: Icon(
                  Icons.youtube_searched_for_sharp,
                  color: Colors.red,
                ),
                onTap: () {
                  // Navigator.pushNamed(context, Navigator().years);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Years()));
                },
              ),
              mytiles("Favourites", Icons.heart_broken, ""),
              mytiles("Subscriptions", Icons.subscriptions, ""),
              mytiles("Updates", Icons.update, ""),
              mytiles("Contact Us", Icons.call, ""),
            ],
          ),

          backgroundColor: Colors.black,
          // elevation: 0,
          shadowColor: Colors.red,
          // elevation: 1,

          // surfaceTintColor: Colors.white,
          width: 160.w,
        ),
        appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Wrap(
              children: [
                Text(
                  "over",
                  style: TextStyle(letterSpacing: 6),
                ),
                Text(
                  "THE",
                  style: TextStyle(letterSpacing: 6, color: Colors.red),
                ),
                Text(
                  "TOP",
                  style: TextStyle(
                    letterSpacing: 6,
                  ),
                ),
              ],
            )),
        body: RefreshIndicator(
          color: Colors.red,
          onRefresh: _handleRefresh,
          child: ListView(
            children: [
              // VideoApp(),
              // Posterssss(p: photos),
              TrendingMovies(Trending: trendingmovies),
              topratedMovies(toprated: topratedmovies),
              tv(tvshow: populartvshows)
              // Upcomingmovies(upcoming: upcomingmovies)
              // topratedMovies(toprated: topratedmovies,
            ],
          ),
        ),
        // ),
      ),
    );
  }

  Widget mytiles(title, icon, routename) {
    return ListTile(
      hoverColor: Color.fromARGB(255, 43, 43, 43),
      // selectedTileColor: Colors.red,
      selected: true,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 10.sp,
          color: Colors.white,
        ),
      ),
      leading: Icon(
        icon,
        color: Colors.red,
      ),
      onTap: () {
        Navigator.pushNamed(context, routename);
      },
    );
  }
}
