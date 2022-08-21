import 'package:flutter/material.dart';
import 'package:involved/customText.dart';
import 'package:involved/keys.dart';
import 'package:involved/ui/description.dart';
import 'description.dart';

class PopularMovies extends StatelessWidget {
  final List popularMovies;

  const PopularMovies({Key? key, required this.popularMovies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(text: 'Popular Movies🌠', size: 23),
          const SizedBox(height: 10,),
          Container(
            height: 210,
            child: ListView.builder(itemCount: popularMovies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context)=>Description(name: popularMovies[index]['title'],
                            bannerUrl: link +popularMovies[index]['backdrop_path'],
                            posterUrl: link +popularMovies[index]['poster_path'],
                            description: popularMovies[index]['overview'],
                            vote: popularMovies[index]['vote_average'].toString(),
                            launchOn: popularMovies[index]['release_date'],
                            id: popularMovies[index]['id']!.toString(),)
                      )
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        link+(popularMovies[index]['backdrop_path']??popularMovies[index]['backdrop_path'])
                                    ), fit: BoxFit.cover
                                )
                            ),
                          ),
                          const SizedBox(height: 10,),
                          ModifiedText(text: popularMovies[index]['title'] ?? 'Loading', size: 16),
                        ],
                      ),
                    )
                  );
                }),),

        ],
      ),
    );
  }
}
