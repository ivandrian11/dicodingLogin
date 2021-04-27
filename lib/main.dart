import 'package:dicoding_login/common/config.dart';
import 'package:dicoding_login/model/theme_model.dart';
import 'package:dicoding_login/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeModel())],
      child: Consumer<ThemeModel>(
        builder: (_, theme, __) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dicoding Login',
          theme: ThemeData.light().copyWith(
            primaryColor: Colors.white,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: lightRedColor,
              selectionHandleColor: lightRedColor,
              selectionColor: lightRedColor.withOpacity(0.5),
            ),
          ),
          darkTheme: ThemeData.dark().copyWith(
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: lightBlueColor,
              selectionHandleColor: lightBlueColor,
              selectionColor: lightBlueColor.withOpacity(0.5),
            ),
          ),
          themeMode: theme.mode,
          home: HomePage(),
        ),
      ),
    );
  }
}
