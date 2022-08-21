import 'package:flutter/material.dart';
import 'package:involved/ui/description.dart';
import 'package:involved/keys.dart';
import '../customText.dart';

class PopularSeries extends StatelessWidget {
  final List popularTv;

  const PopularSeries({Key? key, required this.popularTv}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const ModifiedText(text:'Popular Tv shows🌠',size: 23,
          ),
          const SizedBox(height: 10,),
          Container(
            height: 210,
            child: ListView.builder(itemCount: popularTv.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return InkWell(
                      onTap: () {
                        print(' popularTvIndex =${popularTv[index]}');
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context)=>Description(name: popularTv[index]['name'] ?? popularTv[index]['original_name'] ?? popularTv[index]['title'] ,
                            bannerUrl: link +(popularTv[index]['backdrop_path'] ?? popularTv[index]['poster_path'] ),
                            posterUrl: link +(popularTv[index]['poster_path'] ?? popularTv[index]['backdrop_path']),
                            description: popularTv[index]['overview'] ,
                            vote: popularTv[index]['vote_average'].toString() ,
                            launchOn: popularTv[index]['first_air_date'] ?? popularTv[index]['release_date'],
                            id: popularTv[index]['id'].toString(), )
                      ));
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
                                        link +(popularTv[index]['backdrop_path'] ?? popularTv[index]['poster_path']!)
                                    ), fit: BoxFit.cover
                                )
                            ),
                          ),
                          const SizedBox(height: 10,),
                          ModifiedText(text:popularTv[index]['name'] ?? popularTv[index]['original_name'] ?? 'Loading',
                            size: 16 ,)
                        ],
                      ),
                    )
                  );
                }),
          ),
        ],
      ),
    );
  }
}
