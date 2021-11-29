import 'package:atlas/config/routes/routs.dart';
import 'package:atlas/config/themes/dark_theme.dart';
import 'package:atlas/config/themes/light_theme.dart';
import 'package:atlas/core/splash/views/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common/theme/bloc/theme_bloc.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return _buildThemedApp(context, state);
        },
      ),
    );
  }

  MaterialApp _buildThemedApp(BuildContext context, ThemeState state) {
    return MaterialApp(
      title: 'WeChat',
      onGenerateRoute: _router.onGenerateRoute,
      home: SplashPage(),
      darkTheme: darkTheme.copyWith(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme.copyWith(
                subtitle1: TextStyle(color: Colors.white),
                bodyText2: TextStyle(color: Colors.white),
              ),
        ),
      ),
      theme: lightTheme.copyWith(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      themeMode: state.selectedTheme,
      debugShowCheckedModeBanner: false,
    );
  }

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }
}
