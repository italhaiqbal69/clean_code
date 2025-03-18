import 'package:clean_code_architechture/data/response/api_response.dart';
import 'package:clean_code_architechture/model/movies_list_model.dart';
import 'package:clean_code_architechture/repository/movies_list_repository.dart';
import 'package:flutter/material.dart';

class MoviesList_ViewModel with ChangeNotifier {
  final _myrepo = MoviesListRepository();

  ApiResponse<MoviesListModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MoviesListModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading());

    _myrepo.FetchMovieApi().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, StackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
