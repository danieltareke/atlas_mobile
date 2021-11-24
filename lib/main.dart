import 'package:atlas/config/routes/routs.dart';
import 'package:atlas/core/splash/views/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeChat',
      onGenerateRoute: _router.onGenerateRoute,
      home: SplashPage(),
      theme: ThemeData(textTheme: GoogleFonts.robotoTextTheme()),
      debugShowCheckedModeBanner: false,
    );
  }

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }
}
