import 'package:dio/dio.dart';
import '../core/constants/api_constants.dart';

class DioClient {
  // Singleton pattern — ensures only one Dio instance exists in the whole app
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;
  DioClient._internal();

  // Dio is like a more powerful version of http package
  // It handles headers, query params, errors, and interceptors out of the box
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      // These query params are automatically added to EVERY request
      // So you never have to manually add api_key each time
      queryParameters: {'api_key': ApiConstants.apiKey},
      // How long to wait when connecting to the server
      connectTimeout: const Duration(seconds: 5),
      // How long to wait when receiving data from the server
      receiveTimeout: const Duration(seconds: 5),
    ),
  );
}
