import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/Utils/colors.dart';
import 'package:food_app/Utils/styles.dart';
import 'package:food_app/config/routes/routes.dart';
import 'package:food_app/config/size_config/size_config.dart';
import 'package:food_app/core/auth/presentation/login_screen.dart';
import 'package:food_app/core/auth/provider/auth_providers.dart';
import 'package:food_app/core/menu/provider/food_provider.dart';
import 'package:food_app/splash_screen.dart';
import 'package:provider/provider.dart';

import 'config/network/network_config.dart';
import 'core/menu/presentation/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NetworkConfig().initNetworkConfig();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> with WidgetsBindingObserver {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("Starting");
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: AppColor.LM_BACKGROUND_BASIC,
    ));

    return MultiProvider(
      providers: [
        //  view providers
        ChangeNotifierProvider<Auth>(
          create: (_) => Auth(tokens: '', userId: ''),
        ),
        ChangeNotifierProvider<FoodViewModel>(
          create: (_) => FoodViewModel(),
        ),
      ],
      child: FutureBuilder(
          // Initialize FlutterFire:
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("Something went wrong");

              return Center(
                child: Text("${snapshot.error}"),
              );
            }

            // Once complete, show your application
            if (snapshot.connectionState == ConnectionState.done) {
              print("Firebase initialization completed");

              return Consumer<Auth>(
                  builder: (ctx, auth, _) => MaterialApp(
                      title: 'Food App',
                      debugShowCheckedModeBanner: false,
                      theme: Styles.lightTheme,
                      onGenerateRoute: RouteGenerator.generateRoute,
                      home: Builder(
                        builder: (context) {
                          final Size size = MediaQuery.of(context).size;
                          SizeConfig.init(context,
                              height: size.height,
                              width: size.width,
                              allowFontScaling: true);
                          return auth.authenticated
                              ? HomeScreen() // is user already authenticated
                              : FutureBuilder(
                                  future: auth.tryAutoLogin(),
                                  builder: (ctx, authResult) => authResult
                                              .connectionState ==
                                          ConnectionState.waiting
                                      ? SplashScreen() // waiting to check if user already logged in
                                      : EmailAuthScreen());
                        },
                      )));
            }
            print("Waiting for Firebase initialization");
            return Flex(direction: Axis.vertical, children: [
              Expanded(
                child: Container(color: Colors.white),
              )
            ]);
          }),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
