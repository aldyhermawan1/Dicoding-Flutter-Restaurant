import 'package:dicoding_restaurant/model/restaurant.dart';
import 'package:dicoding_restaurant/values/strings.dart';
import 'package:flutter/material.dart';

import 'component/restaurant_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
        leading: const Icon(Icons.restaurant),
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurants = parseRestaurant(snapshot.data);
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              return RestaurantItem(restaurant: restaurants[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 8);
            },
          );
        },
      ),
    );
  }
}
