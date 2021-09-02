import 'package:dio/dio.dart';

String baseUrl = "https://jsonplaceholder.typicode.com/";

Dio apiFetchdio() {
  Dio dio = new Dio();
  dio.options.baseUrl = baseUrl;
  dio.options.responseType = ResponseType.plain;
  return dio;
}

Dio Applicationdio() {
  Dio dio = new Dio();
  dio.options.baseUrl = baseUrl;
  dio.options.contentType = Headers.formUrlEncodedContentType;
  dio.options.headers['accept'] = 'Application/Json';
  return dio;
}
