import 'package:dio/dio.dart';
import 'package:ulearning_app/common/values/constants.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() {
    return _instance;
  }

  late Dio _dio;
  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.serverApiUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: 'application/json: charset=utf-8',
      responseType: ResponseType.json,
    );

    _dio = Dio(options);
  }

  Future post({
    required String path,
    dynamic myData,
    Map<String, dynamic>? queryParameters,
  }) async {
    print("Post method is called now");
    var response =
        await _dio.post(path, data: myData, queryParameters: queryParameters);
    // from backend we can have response.statusCode = 200 , 500 , 401 not needing to assign it in code
    // print(response.statusCode);
    // print(response.headers);
    print("My response data is ${response.toString()}");
    return response
        .data; // it is the whole data of response which is json inside json
  }
}
