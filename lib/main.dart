import 'package:facebook_messenger/pages/messenger.dart';
import 'package:facebook_messenger/pages/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
        builder:
            (BuildContext context, ThemeModel themeNotifier, Widget? child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            themeMode: themeNotifier.isDark?ThemeMode.dark:ThemeMode.light,
            darkTheme: ThemeData(
                colorScheme: ColorScheme.dark(
                    secondary: Colors.white,
                    secondaryVariant: Colors.white.withOpacity(0.2),
                    onSecondary: Colors.white.withOpacity(0.2),
                    onBackground: Colors.black,
                    onError: const Color(0xff676E75),
                    onSurface: Colors.white),
                scaffoldBackgroundColor: Colors.black,
                listTileTheme:
                const ListTileThemeData(iconColor: Color(0xff43474D)),
                appBarTheme: AppBarTheme(
                  backgroundColor: const Color(0xff111111).withOpacity(0.6),
                ),
                textTheme: TextTheme(
                    bodyText2:
                    TextStyle(color: Colors.white.withOpacity(0.35)),
                    subtitle1: const TextStyle(color: Colors.white),
                    caption:
                    TextStyle(color: Colors.white.withOpacity(0.5))),
                fontFamily: "Sf Display Pro"),
            theme: ThemeData(
                colorScheme: ColorScheme.dark(
                    secondary: Colors.black,
                    secondaryVariant: Colors.black.withOpacity(0.04),
                    onSecondary: Colors.black.withOpacity(0.2),
                    onBackground: Colors.white,
                    onError: const Color(0xffA4AAB2),
                    onSurface: Colors.black),
                scaffoldBackgroundColor: Colors.white,
                listTileTheme:
                const ListTileThemeData(iconColor: Color(0xffC2C6CC)),
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.transparent,
                    titleTextStyle: TextStyle(
                        color: Colors.black, fontFamily: "Sf Display Pro")),
                textTheme: TextTheme(
                    bodyText2:
                    TextStyle(color: Colors.black.withOpacity(0.35)),
                    subtitle1: const TextStyle(color: Colors.black),
                    caption:
                    TextStyle(color: Colors.black.withOpacity(0.5))),
                fontFamily: "Sf Display Pro"),
            home: const MessengerPage(),
            routes: {MessengerPage.id: (context) => const MessengerPage()},
          );
        },
      ),
    );
  }
}
