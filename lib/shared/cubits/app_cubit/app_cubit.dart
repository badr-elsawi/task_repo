import 'package:api_test/shared/cubits/app_cubit/app_states.dart';
import 'package:bloc/bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
}