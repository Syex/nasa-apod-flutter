
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@module
abstract class DataModule {

  @Named("baseUrl")
  String get baseUrl => "https://api.nasa.gov/planetary/apod";

  @lazySingleton
  http.Client provideHttpClient() => http.Client();
}
