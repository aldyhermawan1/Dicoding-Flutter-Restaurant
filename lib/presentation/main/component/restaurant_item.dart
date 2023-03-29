import 'package:dicoding_restaurant/model/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantItem extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantItem({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Hero(
              tag: restaurant.id,
              child: ClipRRect(
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(10)),
                child: Image.network(
                  restaurant.pictureId,
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
                  Text(
                    restaurant.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
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
                  const SizedBox(height: 4),
                  Row(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}