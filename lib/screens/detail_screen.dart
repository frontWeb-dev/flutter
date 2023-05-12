import 'package:coin_flt/models/webtoon_detail_model.dart';
import 'package:coin_flt/models/webtoon_episode_model.dart';
import 'package:coin_flt/services/api_service.dart';
import 'package:coin_flt/widgets/widget_bigletter.dart';
import 'package:coin_flt/widgets/widget_episode.dart';
import 'package:coin_flt/widgets/widget_image.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLastestEpisodesByid(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2, // shadow
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontFamily: 'SCDream',
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Column(
            children: [
              Center(
                child: Hero(
                  tag: widget.id,
                  child: WebtoonImage(
                    thumb: widget.thumb,
                    large: false,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Bigletter(string: snapshot.data!.about),
                        const SizedBox(height: 20),
                        Text(
                          "${snapshot.data!.genre} / ${snapshot.data!.age}",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    );
                  }
                  return const Text("...");
                },
              ),
              const SizedBox(height: 20),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 260,
                      child: Expanded(
                        child: makeEpisode(snapshot),
                      ),
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  ListView makeEpisode(AsyncSnapshot<List<WebtoonEpisodeModel>> snapshot) {
    return ListView.separated(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        final episode = snapshot.data![index];
        return Episode(
          episode: episode,
          webtoonId: widget.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}
