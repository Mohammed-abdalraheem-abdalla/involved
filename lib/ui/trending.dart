import 'package:flutter/material.dart';
import 'package:involved/customText.dart';
import 'package:involved/keys.dart';
import 'description.dart';

class Trending extends StatelessWidget {
  final List trending;

  const Trending({Key? key, required this.trending}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children:[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ModifiedText(text: 'Trending🔥', size: 23),
              const SizedBox(height: 10,),
              Container(
                height: 250,
                child: ListView.builder(itemCount:trending.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(
                              builder: (context)=>Description(name: trending[index]['title'] ?? trending[index]['original_name'] ?? 'Loading',
                                bannerUrl: link +trending[index]['backdrop_path'],
                                posterUrl: link +trending[index]['poster_path'],
                                description: trending[index]['overview'],
                                vote: trending[index]['vote_average'].toString(),
                                launchOn: trending[index]['release_date'] ?? trending[index]['first_air_date'],
                                id: trending[index]['id'].toString())));
                        },
                        child: Container(
                          width: 145,
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          link +trending[index]['poster_path']
                                      ),
                                    )
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Expanded( child:
                                ModifiedText(text: trending[index]['title'] ?? trending[index]['original_name'] ?? 'Loading',
                                    size: 16),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),),
            ],
          ),
          /*
          Positioned(bottom: 160,right: 1,child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              bottomLeft: Radius.circular(100),
            ) ,
            child: TextButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(Size.fromRadius(25)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: ()  {

              },
              child: Icon(Icons.add),
            ),
          )
          ),
          */
        ]
      ),
    );
  }
}
