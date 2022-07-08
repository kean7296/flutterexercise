import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_logic.dart';
import 'package:travel_app/services/data_services.dart';
import 'package:travel_app/views/pages/detail_page.dart';
import 'package:travel_app/views/pages/main_page.dart';
import 'package:travel_app/views/welcome_page.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubit>(
        create: (context) => AppCubit(data: DataServices()),
        child: const AppCubitLogic(),
      ),
    );
  }
}
