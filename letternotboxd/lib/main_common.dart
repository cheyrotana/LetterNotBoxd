import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:letternotboxd/services/movie_service.dart';
import 'viewmodels/home_viewmodel.dart';
// import 'viewmodels/search_viewmodel.dart';
// import 'viewmodels/movie_detail_viewmodel.dart';
// import 'viewmodels/watchlist_viewmodel.dart';
import 'core/theme/app_theme.dart';

Future<void> mainCommon({required String env}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Single shared instance of MovieService injected into all viewmodels
  final movieService = MovieService();

  runApp(MyApp(env: env, movieService: movieService));
}

class MyApp extends StatelessWidget {
  final String env;
  final MovieService movieService;

  const MyApp({super.key, required this.env, required this.movieService});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeViewmodel(movieService: movieService,),
        ),
        // ChangeNotifierProvider(
        //   create: (_) => SearchViewModel(movieService: movieService),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => MovieDetailViewModel(movieService: movieService),
        // ),
        // ChangeNotifierProvider(create: (_) => WatchlistViewModel()),
      ],
      child: MaterialApp(
        title: 'FlutterBoxd',
        debugShowCheckedModeBanner: env == 'dev',
        theme: AppTheme.darkTheme,
        home: const Placeholder(),
      ),
    );
  }
}
