import 'package:coures_example/anime_model.dart';
import 'package:flutter/material.dart';

class AnimeListItemCard extends StatelessWidget {
  const AnimeListItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Data item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Colors.grey,
            )
          ]),
      child: Row(
        children: [
          //image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Hero(
              tag: item.title,
              child: Image.network(
                item.images.jpg!.imageUrl!,
                fit: BoxFit.cover,
                height: 60,
                width: 60,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title
                Text(
                  item.title,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),

                // year
                Text(
                  '${item.year}',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // rank
              Text(
                '# ${item.rank}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.red,
                      backgroundColor: Colors.red.withOpacity(0.3),
                    ),
              ),
              const SizedBox(height: 12),
              // score
              Text('${item.score}'),
            ],
          ),
        ],
      ),
    );
  }
}
