import 'package:app_tesing/models/food.dart';
import 'package:app_tesing/models/recipe.dart';
import 'package:flutter/material.dart';

class FoodTile extends StatelessWidget {
  final Recipe? food;
  final void Function()? onTap;
  const FoodTile({super.key, required this.food, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  // text food details
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food?.name ?? ""),
                      Text(
                        food?.instructions.join("\n\n") ??
                            "", // double newline between steps
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),

                      // Text(
                      //   '\$' + food.price.toString(),
                      //   style: TextStyle(
                      //       color: Theme.of(context).colorScheme.primary),
                      // ),
                      // SizedBox(height: 10),
                      // Text(
                      //   food?.instructions.first ?? "",
                      //   style: TextStyle(
                      //     color: Theme.of(context).colorScheme.inversePrimary,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(width: 15),

                // food image
                _imageWidget(food?.image),

                // ClipRRect(
                //   borderRadius: BorderRadius.circular(8),
                //   child: Image.network(
                //     food?.image ?? "",
                //     width: 120,
                //     height: 120,
                //     fit: BoxFit.cover,
                //   ),
                // ),
              ],
            ),
          ),
        ),
        // divider line
        Divider(
          color: Theme.of(context).colorScheme.primary,
          endIndent: 25,
          indent: 25,
        ),
      ],
    );
  }

  Widget _imageWidget(String? imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: (imageUrl != null && imageUrl.isNotEmpty)
          ? Image.network(
              imageUrl,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: 120,
                  height: 120,
                  color: Colors.grey[200],
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 120,
                  height: 120,
                  color: Colors.grey[300],
                  child: Icon(
                    Icons.broken_image,
                    size: 40,
                    color: Colors.grey[600],
                  ),
                );
              },
            )
          : Container(
              width: 120,
              height: 120,
              color: Colors.grey[300],
              child: Icon(
                Icons.image_not_supported,
                size: 40,
                color: Colors.grey[600],
              ),
            ),
    );
  }
}
