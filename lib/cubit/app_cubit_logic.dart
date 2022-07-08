import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubic_states.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/views/pages/detail_page.dart';
import 'package:travel_app/views/pages/home_page.dart';
import 'package:travel_app/views/pages/main_page.dart';
import 'package:travel_app/views/welcome_page.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({Key? key}) : super(key: key);

  @override
  State<AppCubitLogic> createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const WelcomePage();
          }
          if (state is DetailState) {
            return DetailPage();
          }
          if (state is LoadedState) {
            return const Center(
              child: HomePage(),
            );
          }
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
