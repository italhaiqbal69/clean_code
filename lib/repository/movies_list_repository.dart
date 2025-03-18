import 'package:clean_code_architechture/data/network/NetworkApiService.dart';
import 'package:clean_code_architechture/data/network/baseApiService.dart';
import 'package:clean_code_architechture/model/movies_list_model.dart';
import 'package:clean_code_architechture/res/app_urls.dart';

class MoviesListRepository {
  final BaseApiServices _baseApiServices = NetworkApiServices();

  Future<MoviesListModel> FetchMovieApi() async {
    try {
      dynamic response =
          await _baseApiServices.getGetApiResponse(AppUrls.moviesEndpoint);
      return response = MoviesListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
