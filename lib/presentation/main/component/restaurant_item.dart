import 'package:dicoding_restaurant/data/model/restaurant.dart';
import 'package:dicoding_restaurant/values/strings.dart';
import 'package:flutter/material.dart';

class RestaurantItem extends StatelessWidget {
  final Restaurant restaurant;
  final Function() detailNavigationAction;

  const RestaurantItem({
    super.key,
    required this.restaurant,
    required this.detailNavigationAction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          detailNavigationAction();
        },
        child: Row(
          children: [
            Hero(
              tag: restaurant.id,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(10)),
                child: Image.network(
                  baseUrlImageSmall + restaurant.pictureId,
                  fit: BoxFit.cover,
                  width: 125,
                  height: 100,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: restaurant.id + restaurant.name,
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        restaurant.name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Hero(
                    tag: restaurant.id + restaurant.city,
                    child: Material(
                      type: MaterialType.transparency,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.share_location),
                          const SizedBox(width: 4),
                          Text(
                            restaurant.city,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Hero(
                    tag: restaurant.id + restaurant.rating.toString(),
                    child: Material(
                      type: MaterialType.transparency,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.star),
                          const SizedBox(width: 4),
                          Text(
                            restaurant.rating.toString(),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
