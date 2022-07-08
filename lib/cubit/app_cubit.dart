import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubic_states.dart';
import 'package:travel_app/models/data_model.dart';
import 'package:travel_app/services/data_services.dart';

class AppCubit extends Cubit<CubitStates> {
  final DataServices data;
  late final places;
  // AppCubit(super.initialState);
  AppCubit({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {
      print(e);
    }
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
