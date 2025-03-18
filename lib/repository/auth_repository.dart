import 'package:clean_code_architechture/data/network/NetworkApiService.dart';
import 'package:clean_code_architechture/data/network/baseApiService.dart';
import 'package:clean_code_architechture/res/app_urls.dart';

class AuthRepository {
  final BaseApiServices _baseApiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _baseApiServices.getPostApiResponse(AppUrls.loginUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signupApi(dynamic data) async {
    try {
      dynamic response =
          await _baseApiServices.getPostApiResponse(AppUrls.registerUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
