part of 'movie_view_model.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TwicePopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(L10n.current.discoverMovies),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            return ref.watch(movieListProvider).when(
                  data: (data) => _ListBody(data),
                  error: (error, stackTrace) => _ErrorBody(
                    error: error,
                    stackTrace: stackTrace,
                  ),
                  loading: () => const _LoadingBody(),
                );
          },
        ),
      ),
    );
  }
}

class _ListBody extends StatelessWidget {
  const _ListBody(this.movieList, {super.key});

  final List<Movie> movieList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(WidgetStyle.p16),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: WidgetStyle.p12,
        mainAxisSpacing: WidgetStyle.p12,
        childAspectRatio: 0.635,
      ),
      itemCount: movieList.length,
      itemBuilder: (context, index) => _RoundedMovieImage(
        key: ValueKey(movieList[index].id),
        movie: movieList[index],
      ),
    );
  }
}

class _RoundedMovieImage extends StatelessWidget {
  const _RoundedMovieImage({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(WidgetStyle.p8),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MoviePage(
            id: movie.id,
          ),
        )),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          width: double.infinity,
          imageUrl: "https://image.tmdb.org/t/p/original${movie.posterPath}",
          placeholder: (context, url) => const _LoadingBody(),
        ),
      ),
    );
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody({
    super.key,
    required this.error,
    required this.stackTrace,
  });

  final Object error;
  final StackTrace stackTrace;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error.toString()),
    );
  }
}

class _LoadingBody extends StatelessWidget {
  const _LoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
