import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:coin_flt/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = "today";

  // http install : flutter pub add http
  // Futuer : 당장 완료할 수 없는 작업 , 비동기 함수의 반환 타입 / Response 반환
  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // string -> JSON decoding
      final List<dynamic> webtoons = jsonDecode(response.body);

      for (var webtoon in webtoons) {
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }
      return webtoonInstances;
    }

    throw Error();
  }
}

/*
  return webtoons.map((webtoon) => WebtoonModel.fromJson(webtoon)).toList();
*/