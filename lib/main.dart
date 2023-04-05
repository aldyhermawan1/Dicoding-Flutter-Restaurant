import 'package:dicoding_restaurant/bloc/restaurant_bloc.dart';
import 'package:dicoding_restaurant/data/model/restaurant.dart';
import 'package:dicoding_restaurant/di/injector.dart';
import 'package:dicoding_restaurant/presentation/detail/detail_screen.dart';
import 'package:dicoding_restaurant/presentation/main/main_screen.dart';
import 'package:dicoding_restaurant/values/routes.dart';
import 'package:dicoding_restaurant/values/strings.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var myDebugTree = DebugTree();

    Fimber.plantTree(myDebugTree);
    injectModules();
    return MultiBlocProvider(
      providers: [
        BlocProvider<RestaurantBloc>(create: (context) => locator.get())
      ],
      child: MaterialApp(
        title: appTitle,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        initialRoute: routeMain,
        routes: {
          routeMain: (context) => const MainScreen(),
          routeDetail: (context) => DetailScreen(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant),
        },
      ),
    );
  }
}
