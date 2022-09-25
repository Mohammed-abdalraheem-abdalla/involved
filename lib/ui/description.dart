import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:involved/utils/customText.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/moviesVideosModel.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Description extends StatefulWidget {
  final String? name, description, bannerUrl, posterUrl, vote, launchOn, id;
  const Description({
    Key? key,
    required this.id,
    required this.name,
    required this.description,
    required this.bannerUrl,
    required this.posterUrl,
    required this.vote,
    required this.launchOn,
  }) : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  late YoutubePlayerController controller;
  late List<String> vidKey;

   @override
   void deactivate() {
     controller.pause();

     super.deactivate();
   }

   @override
   void dispose() {
     controller.dispose();
     super.dispose();
   }

  @override
  initState() {

    getVideosById(widget.id!)
        .then((value) => setState(() => vidKey = value));
    controller = YoutubePlayerController(
        initialVideoId: 'lsgSGHyXRiE',

        flags: const YoutubePlayerFlags(
          autoPlay: true,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: true,
        ));

    super.initState();
  }

  Future<List<String>> getVideosById(String movieId) async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId/videos?api_key=208b87f84d731be74f5982ca297073af&language=en-US');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map result = json.decode(response.body);
      final List videosResult = result['results'];
      final videoLListResult =
          videosResult.map((json) => Result.fromJson(json)).toList();
      return videoLListResult.map((video) => video.key).toList();
    } else {
      throw Exception();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: ListView(
              children: [
                Container(
                  height: 250,
                  child: Stack(
                    children: [
                      Positioned(
                          child: SizedBox(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(widget.bannerUrl!, fit: BoxFit.cover),
                      )),
                      Positioned(
                          bottom: 10,
                          left: 5,
                          child: ModifiedText(
                              text:
                                  'Rating - ${widget.vote ?? ''.substring(0, 3)} 🌟',
                              size: 16)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    child:
                        ModifiedText(text: widget.name ?? 'Not loaded', size: 23)),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: ModifiedText(
                        text: 'Release date : ${widget.launchOn!}'.substring(0, 25),
                        size: 16)),
                const SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 0.5,
                  color: Theme.of(context).splashColor,
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      height: 220,
                      width: 150,
                      child: Image.network(widget.posterUrl ?? widget.bannerUrl!),
                    ),
                    Flexible(
                      child: ModifiedText(
                          text: widget.description ?? 'Not Available', size: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: (){
                    controller.load(vidKey.first.toString());
                  },
                    child: const Text('Trailer'),
                ),
              ],
            ),
          );

  }
}