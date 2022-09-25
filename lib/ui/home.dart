import 'dart:convert';
import 'package:involved/utils/customText.dart';
import 'package:involved/utils/searching.dart';
import 'package:involved/ui/settings.dart';
import 'package:involved/ui/popularMovies.dart';
import 'package:involved/ui/trending.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:involved/utils/keys.dart';
import 'package:involved/ui/popularSeries.dart';
import '../utils/menu.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List trending = [];
  List popularMovies = [];
  List popularSeries = [];

   int pageNum = 1;

   late Map trendingData;
   late Map popularMoviesData;
   late Map popularSeriesData;

  @override
  void initState() {
    getTrending();
    getPopularMovies();
    getPopularSeries();
    super.initState();
  }

  getTrending() async{
    var client = http.Client();
    var uri = Uri.parse(
        'https://api.themoviedb.org/3/trending/all/day?api_key=$apiKey&page=$pageNum');
    var response = await client.get(uri);
    if(response.statusCode == 200) {
      var json = response.body;
      trendingData = jsonDecode(json);
      setState(() {
        trending = trendingData['results'];
      });

    }
    }


    getPopularMovies() async{
      var client = http.Client();
      var uri = Uri.parse(
          'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=$pageNum&append_to_response=videos,images');
      var response = await client.get(uri);
      if(response.statusCode == 200) {
        var json = response.body;
        popularMoviesData = jsonDecode(json);
        setState(() {
          popularMovies = popularMoviesData['results'];
        });

      }
    }
  getPopularSeries() async{
    var client = http.Client();
    var uri = Uri.parse(
        'https://api.themoviedb.org/3/tv/popular?api_key=$apiKey&language=en-US&page=$pageNum'
    );
    var response = await client.get(uri);
    if(response.statusCode == 200) {
      var json = response.body;
      popularSeriesData = jsonDecode(json);
      setState(() {
        popularSeries = popularSeriesData['results'];
      });
    }
  }

    loadMoreTrending() async{
   /// ToDo : load page 2 from every list
      ///
    }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: Theme.of(context).iconTheme,
          backgroundColor: Colors.transparent,
         // title: const ModifiedText(text: text, color: color, size: size),
          centerTitle: true,
          actions: [
          PopupMenuButton<MyMenuItem>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context)
          => [
            ...MenuItems.items.map(buildItem).toList(),

          ],
          ),
          ],
          leading: IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchData());
            },
            icon:  Icon(Icons.search,size: 30, color: Theme.of(context).splashColor,),
          ),
        ),
        body: ListView(
            children: [
              PopularMovies(popularMovies: popularMovies),
              Trending(trending: trending),
              PopularSeries(popularTv: popularSeries),
              //Searching(searchMedia: searchList),
            ],
           ),
      ),
    );
  }

  onSelected(BuildContext context, MyMenuItem item) {
   switch (item) {
     case MenuItems.itemSettings:
       Navigator.of(context).push(
         MaterialPageRoute(builder: (context) => const SettingsPage() ),
       );
   }
  }
}

PopupMenuItem<MyMenuItem> buildItem(MyMenuItem item)
  => PopupMenuItem<MyMenuItem>(
    value: item,
    child: Row(
    children: [
      Icon(item.icon, size: 20),
      const SizedBox(width: 20),
      ModifiedText(text: item.text , size: 15),
    ],
  ),

  );