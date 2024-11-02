import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  final String title;
  final String imageUrl;
  final bool isFavorite;
  final double rating;
  final VoidCallback onFavoriteToggle;

  const Book({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Book Image
        Container(
          height: 200,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.fill,
            ),
          ),
        ),
        // Book Title, Rating, and Favorite Button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Book Title
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        // color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                        height: 4), // Small spacing between title and rating
                    // Book Rating
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(
                          "$rating",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.grey,
                          ),
                          onPressed: onFavoriteToggle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Favorite Icon Button
              // IconButton(
              //   icon: Icon(
              //     isFavorite ? Icons.favorite : Icons.favorite_border,
              //     color: isFavorite ? Colors.red : Colors.grey,
              //   ),
              //   onPressed: onFavoriteToggle,
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
