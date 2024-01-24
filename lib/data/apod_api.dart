import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:nasa_apod/data/picture_entity.dart';

@injectable
class ApodApi {
  final http.Client _httpClient;
  final String _baseUrl;

  ApodApi(this._httpClient, @Named("baseUrl") this._baseUrl);

  Future<PictureEntity> getPictureOfToday() async {
    var uri = Uri.parse(_baseUrl);

    final queryParams = {"api_key": "DEMO_KEY"};

    uri = uri.replace(queryParameters: queryParams);

    final response = await _httpClient.get(uri);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return PictureEntity.fromJson(jsonResponse);
    } else {
      throw Exception("getPictureOfToday fetch failed with"
          " ${response.statusCode} ${response.reasonPhrase}");
    }
  }
}
