import 'dart:convert' as Convert;
import 'package:activeedgemusic/api/dio.dart';
import 'package:dio/dio.dart' as AppDio;

Future fetchServerData(url) async {
  try {
    AppDio.Response response = await apiFetchdio().get(url);
    var data = Convert.jsonDecode(response.data);
    return data;
  } on AppDio.DioError catch (e) {
    print(e);
  }
}

Future saveDataServer(url, Map mapData) async {
  try {
    AppDio.Response response = await apiFetchdio().post(
      url,
      data: mapData,
    );
    var data = Convert.jsonDecode(response.data);
    print(data.runtimeType);
    print(data);
    return data;
  } on AppDio.DioError catch (e) {
    print(e);
  }
}
