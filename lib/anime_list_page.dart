import 'package:coures_example/anime_details_page.dart';
import 'package:coures_example/anime_list_provider.dart';
import 'package:coures_example/widgets/anime_list_item_card.dart';
import 'package:coures_example/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimeListPage extends ConsumerWidget {
  const AnimeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(animeListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('anime list'),
        centerTitle: true,
      ),
      body: asyncData.when(
        data: (data) {
          if (data == null) {
            return const AnimeErrorWidget();
          }
          final animeList = data.data;
          return ListView.builder(
            itemCount: animeList!.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnimeDatailsPage(
                    item: animeList[index],
                  ),
                ),
              ),
              child: AnimeListItemCard(
                item: animeList[index],
              ),
            ),
          );
        },
        error: (e, _) => const AnimeErrorWidget(),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
