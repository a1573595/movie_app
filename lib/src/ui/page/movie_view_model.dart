import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movies_app/src/data/model/movie.dart';
import 'package:movies_app/src/data/repository/movie_repository.dart';
import 'package:movies_app/src/ui/l10n/l10n.dart';
import 'package:movies_app/src/ui/style/widget_style.dart';
import 'package:movies_app/src/ui/widget/twice_pop_scope.dart';

part 'movie_list_page.dart';

part 'movie_page.dart';

final movieListProvider = FutureProvider.autoDispose<List<Movie>>((ref) {
  final cancelToken = CancelToken();
  ref.onDispose(() => cancelToken.cancel());

  return ref
      .read(movieRepository)
      .getDiscoverMovie(cancelToken: cancelToken)
      .then((value) => value.results)
      .onError((error, stack) {
        print("test error:$error");
    return Future.error(error!, stack);
  });
});

final movieProvider = FutureProvider.family.autoDispose<Movie, int>((ref, id) {
  final cancelToken = CancelToken();
  ref.onDispose(() => cancelToken.cancel());

  return ref.read(movieRepository).getMovie(id: id, cancelToken: cancelToken).then((value) {
    final link = ref.keepAlive();

    Future.delayed(const Duration(minutes: 10), () => link.close());

    return value;
  });
});
