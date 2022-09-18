import 'package:coures_example/anime_model.dart';
import 'package:flutter/material.dart';

class AnimeDatailsPage extends StatelessWidget {
  const AnimeDatailsPage({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Data item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: item.title,
            child: Image.network(
              item.images.jpg!.largeImageUrl!,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              item.title,
              style: Theme.of(context).textTheme.titleMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                Text(
                  '# ${item.rank}',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.red,
                        backgroundColor: Colors.red.withOpacity(0.3),
                      ),
                ),
                const SizedBox(width: 30),
                Text(
                  '${item.year}',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey,
                      ),
                ),
                // score
                const SizedBox(width: 30),
                Text('${item.score}'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: SingleChildScrollView(
                child: Text(item.synopsis),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
