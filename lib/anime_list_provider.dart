import 'package:coures_example/anime_model.dart';
import 'package:coures_example/services.dart';
import 'package:riverpod/riverpod.dart';

final animeListProvider = FutureProvider<AnimeModel?>((ref) async {
  final services = ref.read(servicesProvider);
  return services.getAnimeList();
});
