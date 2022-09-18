import 'package:coures_example/anime_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimeErrorWidget extends ConsumerWidget {
  const AnimeErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('some thing wronge happens !! 😢'),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => ref.refresh(animeListProvider),
            child: const Text('retry'),
          )
        ],
      ),
    );
  }
}
