import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movies_app/src/ui/l10n/l10n.dart';
import 'package:movies_app/src/ui/page/movie_view_model.dart';

void main() async {
  CustomImageCache();

  WidgetsFlutterBinding.ensureInitialized();

  // make navigation bar transparent
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white.withOpacity(0.9),
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // make flutter draw behind navigation bar
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  runApp(const ProviderScope(
    child: MoviesApp(),
  ));
}

class CustomImageCache extends WidgetsFlutterBinding {
  @override
  ImageCache createImageCache() => super.createImageCache()..maximumSizeBytes = 1024 * 1024 * 600;
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movies",
      home: const MovieListPage(),
      supportedLocales: L10n.supportedLocales,
      localizationsDelegates: L10n.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
            TargetPlatform.linux: ZoomPageTransitionsBuilder(),
            TargetPlatform.windows: ZoomPageTransitionsBuilder(),
            TargetPlatform.macOS: ZoomPageTransitionsBuilder(),
            TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
    );
  }
}
