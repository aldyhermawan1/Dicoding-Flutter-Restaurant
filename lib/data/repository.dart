import 'package:dicoding_restaurant/data/api/api_client.dart';
import 'package:dicoding_restaurant/util/error/error_handler.dart';

import 'model/restaurant.dart';

class Repository {
  final ApiClient _apiClient;

  Repository(this._apiClient);

  Future<List<Restaurant>?> fetchRestaurantList() {
    return _apiClient
        .getRestaurantList()
        .then((value) => value.restaurants)
        .catchError((error) {
      errorHandler(error);
    });
  }

  Future<Restaurant?> fetchRestaurantDetail(String id) {
    return _apiClient
        .getRestaurantDetail(id)
        .then((value) => value.restaurant)
        .catchError((error) {
      errorHandler(error);
    });
  }

  Future<List<Restaurant>?> fetchRestaurantSearch(String query) {
    return _apiClient
        .getRestaurantSearch(query)
        .then((value) => value.restaurants)
        .catchError((error) {
      errorHandler(error);
    });
  }
}

class NetworkError extends Error {}
