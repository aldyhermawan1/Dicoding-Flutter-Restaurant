import 'package:dicoding_restaurant/bloc/restaurant_bloc.dart';
import 'package:dicoding_restaurant/bloc/state/fetch_restaurant_list_state.dart';
import 'package:dicoding_restaurant/values/strings.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/state/search_restaurant_state.dart';
import '../../data/model/restaurant.dart';
import '../../values/routes.dart';
import 'component/restaurant_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _query = '';

  @override
  void initState() {
    super.initState();
    getListData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
        title: const Text(appTitle),
        leading: const Icon(Icons.restaurant),
        onSearch: (value) {
          setState(() {
            _query = value;
            if (_query.isNotEmpty) {
              context.read<RestaurantBloc>().add(SearchRestaurantEvent(_query));
            } else {
              context
                  .read<RestaurantBloc>()
                  .add(const GetRestaurantListEvent());
            }
          });
        },
      ),
      body: (_query.isNotEmpty) ? _buildSearchList() : _buildList(),
    );
  }

  void getListData() {
    if (_query.isNotEmpty) {
      context.read<RestaurantBloc>().add(SearchRestaurantEvent(_query));
    } else {
      context.read<RestaurantBloc>().add(const GetRestaurantListEvent());
    }
  }

  Widget _buildList() {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is FetchRestaurantListLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FetchRestaurantListEmptyState) {
          return const Center(child: Text(messageEmptyGeneric));
        } else if (state is FetchRestaurantListErrorState) {
          return Center(child: Text(state.message));
        } else if (state is FetchRestaurantListSuccessState) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.restaurants.length,
            itemBuilder: (context, index) {
              return RestaurantItem(
                restaurant: state.restaurants[index],
                detailNavigationAction: () {
                  detailNavigationAction(state.restaurants[index]);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 8);
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildSearchList() {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is SearchRestaurantLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchRestaurantEmptyState) {
          return const Center(child: Text(messageEmptySearch));
        } else if (state is SearchRestaurantErrorState) {
          return Center(child: Text(state.message));
        } else if (state is SearchRestaurantSuccessState) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.restaurants.length,
            itemBuilder: (context, index) {
              return RestaurantItem(
                restaurant: state.restaurants[index],
                detailNavigationAction: () {
                  detailNavigationAction(state.restaurants[index]);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 8);
            },
          );
        } else {
          return const Center(child: Text(messageErrorGeneric));
        }
      },
    );
  }

  void detailNavigationAction(Restaurant restaurant) {
    Navigator.of(context).pushNamed(routeDetail, arguments: restaurant)
        .whenComplete(() => getListData());
  }
}
