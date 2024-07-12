part of 'movie_view_model.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Consumer(
            builder: (context, ref, child) {
              return ref.watch(movieProvider(id)).when(
                    data: (data) => _MovieBody(data),
                    error: (error, stackTrace) => _ErrorBody(
                      error: error,
                      stackTrace: stackTrace,
                    ),
                    loading: () => const _LoadingBody(),
                  );
            },
          ),
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                top: WidgetStyle.p8,
                left: WidgetStyle.p8,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: BackButton(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieBody extends StatelessWidget {
  const _MovieBody(this.movie, {super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          fit: BoxFit.cover,
          width: double.infinity,
          imageUrl: "https://image.tmdb.org/t/p/original${movie.posterPath}",
          placeholder: (context, url) => const _LoadingBody(),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(WidgetStyle.p16),
            physics: const BouncingScrollPhysics(),
            child: Text(
              movie.overview,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
