import 'package:dicoding_restaurant/presentation/detail/component/menu_list.dart';
import 'package:dicoding_restaurant/values/strings.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/restaurant_bloc.dart';
import '../../bloc/state/fetch_restaurant_detail_state.dart';
import '../../data/model/restaurant.dart';

class DetailScreen extends StatefulWidget {
  final Restaurant restaurant;

  const DetailScreen({super.key, required this.restaurant});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    context
        .read<RestaurantBloc>()
        .add(GetRestaurantDetailEvent(widget.restaurant.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.restaurant.name}'s Detail"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
          child: BlocBuilder<RestaurantBloc, RestaurantState>(
        builder: (context, state) {
          if (state is FetchRestaurantDetailLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FetchRestaurantDetailEmptyState) {
            return const Center(child: Text(messageEmptyGeneric));
          } else if (state is FetchRestaurantDetailErrorState) {
            return Center(child: Text(state.message));
          } else if (state is FetchRestaurantDetailSuccessState) {
            return _buildBody(state.restaurant);
          } else {
            return const Center(child: Text(messageErrorGeneric));
          }
        },
      )),
    );
  }

  Widget _buildBody(Restaurant restaurant) {
    FimberLog('restaurant').d(restaurant.toString());
    return Column(
      children: [
        Image.network(
          baseUrlImageLarge + restaurant.pictureId,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.share_location),
                  const SizedBox(width: 4),
                  Text(
                    restaurant.city,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.home),
                  const SizedBox(width: 4),
                  Text(
                    restaurant.address.toString(),
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.star),
                  const SizedBox(width: 4),
                  Text(
                    restaurant.rating.toString(),
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                labelDescription,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(
                restaurant.description,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              (restaurant.menu == null)
                  ? const Center(child: Text(messageEmptyMenu))
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              const Text(
                                labelFoods,
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              MenuList(
                                listMenu: restaurant.menu!.foods,
                                isFood: true,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              const Text(
                                labelDrinks,
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              MenuList(
                                listMenu: restaurant.menu!.drinks,
                                isFood: false,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
