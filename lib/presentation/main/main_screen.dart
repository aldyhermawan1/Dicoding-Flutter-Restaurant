import 'package:dicoding_restaurant/bloc/restaurant_bloc.dart';
import 'package:dicoding_restaurant/bloc/state/fetch_restaurant_list_state.dart';
import 'package:dicoding_restaurant/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    context.read<RestaurantBloc>().add(const GetRestaurantListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
        leading: const Icon(Icons.restaurant),
      ),
      body: _build(context),
    );
  }

  Widget _build(BuildContext context) {
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
              return RestaurantItem(restaurant: state.restaurants[index]);
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
}
