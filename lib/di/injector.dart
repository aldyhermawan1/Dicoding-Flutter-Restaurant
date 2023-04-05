import 'package:dicoding_restaurant/bloc/restaurant_bloc.dart';
import 'package:dicoding_restaurant/data/api/api_client.dart';
import 'package:dicoding_restaurant/data/repository.dart';
import 'package:dicoding_restaurant/values/strings.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void injectModules() async {
  BaseOptions options = BaseOptions(
      connectTimeout: 60000, receiveTimeout: 60000, followRedirects: false);

  Dio dio = Dio(options);
  dio.options.baseUrl = baseUrl;

  locator.registerSingleton(dio);
  locator.registerSingleton(ApiClient(locator.get()));
  locator.registerSingleton(Repository(locator.get()));
  locator.registerSingleton(RestaurantBloc(locator.get()));
}
