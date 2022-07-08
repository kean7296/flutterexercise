import 'package:equatable/equatable.dart';
import 'package:travel_app/models/data_model.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  List<Object> get props => [];
}

class WelcomeState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadingState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitStates {
  final List<DataModel> places;
  @override
  List<Object> get props => [places];
  LoadedState(this.places);
}

class DetailState extends CubitStates {
  final DataModel place;
  @override
  List<Object> get props => [place];
  DetailState(this.place);
}
