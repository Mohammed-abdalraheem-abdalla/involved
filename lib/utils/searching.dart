import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:involved/models/searchingModel.dart';
import 'package:http/http.dart' as http;
import 'package:involved/ui/description.dart';
import 'constants.dart';
import 'customText.dart';


class SearchData extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, '');
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Result>>(
        future: SearchApi.getSearchData(query),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if(query.isEmpty){
                return buildSuggestions(context);
              }
              if (snapshot.hasError) {
                return Center(
                  child: Container(
                    height: 200,
                   // width: 200,
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: const Text(
                      'Something went wrong!',
                      style: TextStyle(color:
                      Colors.white,),
                    ),
                  ),
                );
              } else {
                return buildResultSuccess(snapshot.data!);
              }
          }
        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: ModifiedText(text: 'Search for movie or series', size: 20),
    );
  }
}

class SearchApi {
  static Future<List<Result>> getSearchData(String queryData) async{

    final url = Uri.parse('https://api.themoviedb.org/3/search/multi?api_key=208b87f84d731be74f5982ca297073af&language=en-US&query=$queryData&page=1');
    final response = await http.get(url);
    if(response.statusCode == 200) {
      final Map result = json.decode(response.body);
      final List searchResult = result['results'];
      return searchResult.map((json) => Result.fromJson(json)).toList();
    }else {
      throw Exception();
    }

  }

}

Widget buildResultSuccess(List<Result> results)
  => ListView.builder(
   itemCount: results.length,
    itemBuilder: (context,index){
     final result = results[index];

     return Card(
       shadowColor: Theme.of(context).splashColor,
       elevation: 6,
       child: ListTile(
         onTap: (){
           Navigator.push(
               context, MaterialPageRoute(
               builder: (context)=>Description(name: result.name ?? result.title ?? result.originalName ?? result.originalTitle,
                   bannerUrl: link+(result.backdropPath ?? result.posterPath!),
                   posterUrl: link+(result.posterPath ?? result.backdropPath!),
                   description: result.overview ?? 'Loading',
                   vote: result.voteAverage.toString(),
                   launchOn:  (result.firstAirDate ?? result.releaseDate).toString(),
                    id: result.id.toString(),

               )
           ),
           );
         },
         title: ModifiedText(text: result.title ?? result.name ?? result.originalName!,size: 18,),
         leading:  CircleAvatar(
           backgroundImage: NetworkImage(
             link+(result.posterPath ?? result.backdropPath ?? 'wait')
         ),
         ),
       ),
     );
    }

  );

