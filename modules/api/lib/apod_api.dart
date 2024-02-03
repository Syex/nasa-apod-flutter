import 'dart:convert';

import 'package:api/picture_entity.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@injectable
class ApodApi {
  final http.Client _httpClient;
  final String _baseUrl;

  ApodApi(this._httpClient, @Named("baseUrl") this._baseUrl);

  Future<PictureEntity> getPictureOfDate(DateTime date) async {
    var uri = Uri.parse(_baseUrl);
    final requestedDate = DateFormat("yyyy-MM-dd").format(date);

    final queryParams = {
      "api_key": "SoRTTFVh6VqNcfSQWJgOTfvPJJnuazQF8ITRDCiu",
      "date": requestedDate
    };

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
