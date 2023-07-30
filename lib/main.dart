import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:humhub/util/const.dart';
import 'package:humhub/util/log.dart';
import 'package:humhub/util/router.dart';
import 'package:loggy/loggy.dart';

main() {
  Loggy.initLoggy(
    logPrinter: const GlobalLog(),
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp>{

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: MyRouter.getInitialRoute(ref),
      builder: (context, snap) {
        if (snap.hasData) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: snap.data,
            routes: MyRouter.routes,
            navigatorKey: navigatorKey,
            theme: ThemeData(
              fontFamily: 'OpenSans',
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
