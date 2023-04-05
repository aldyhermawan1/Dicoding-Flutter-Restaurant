import 'package:dicoding_restaurant/data/model/restaurant_detail_response.dart';
import 'package:dicoding_restaurant/data/model/restaurant_list_response.dart';
import 'package:dicoding_restaurant/data/model/restaurant_search_response.dart';
import 'package:dicoding_restaurant/values/strings.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET('list')
  Future<RestaurantListResponse> getRestaurantList();

  @GET('detail/{id}')
  Future<RestaurantDetailResponse> getRestaurantDetail(@Path('id') String id);

  @GET('search')
  Future<RestaurantSearchResponse> getRestaurantSearch(
      @Query('q') String query);
}
