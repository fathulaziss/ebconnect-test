import 'package:ebconnect_test/provider/home_provider.dart';
import 'package:ebconnect_test/provider/resolution_provider.dart';
import 'package:ebconnect_test/provider/restore_provider.dart';
import 'package:ebconnect_test/screen/home_screen.dart';
import 'package:ebconnect_test/screen/resolution_screen.dart';
import 'package:ebconnect_test/screen/restore_screen.dart';
import 'package:ebconnect_test/services/navigation_service.dart';
import 'package:ebconnect_test/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<RestoreProvider>(
          create: (context) => RestoreProvider(),
        ),
        ChangeNotifierProvider<ResolutionProvider>(
          create: (context) => ResolutionProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return GestureDetector(
            onTap: AppUtils.dismissKeyboard,
            child: child,
          );
        },
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          RestoreScreen.routeName: (context) {
            final data = ModalRoute.of(context)!.settings.arguments != null
                ? ModalRoute.of(context)!.settings.arguments! as int
                : 0;
            return RestoreScreen(groupQuestionId: data);
          },
          ResolutionScreen.routeName: (context) {
            final data = ModalRoute.of(context)!.settings.arguments != null
                ? ModalRoute.of(context)!.settings.arguments! as int
                : 0;
            return ResolutionScreen(groupQuestionId: data);
          },
        },
      ),
    );
  }
}
