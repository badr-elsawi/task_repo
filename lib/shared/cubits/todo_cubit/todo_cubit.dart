import 'package:api_test/models/todo.dart';
import 'package:api_test/shared/cubits/todo_cubit/todo_state.dart';
import 'package:api_test/shared/remote_services/endpoints.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user.dart';
import '../../remote_services/remote_services.dart';

class TodoCubit extends Cubit<TodoStates> {
  TodoCubit() : super(TodoInitialState());

  static TodoCubit get(context) => BlocProvider.of(context);
  // changing page ****************************************************
  int page = 0;

  void changePage(int newPage) {
    page = newPage;
    getStart();
    getEnd();
    emit(ChangePageState());
  }
  int getStart() => page * 40;
  int getEnd(){
    if(((page + 1) * 40) > todos.length+1) return todos.length;
    else return ((page + 1) * 40) ;
  }
  // filter ************************************************************
  bool isFiltered = false ;
  int? selectedId;
  List<TodoModel> filteredList = [];
  void filtered(int userId){
    if(apiPage == 2) getTodos();
    if(userId == selectedId){
      isFiltered = !isFiltered;
      selectedId = null;
      emit(ChangeFilterState());
    }else {
      isFiltered = true;
      selectedId = userId;
      getFilteredList();
      emit(ChangeFilterState());
    }
  }

  void getFilteredList() {
    filteredList = todos.where((element) => element.userId == selectedId).toList();
  }

  // get users **********************************************************
  List<UserModel> users = [];

  void getUsers() async {
    DioService.getData(
      url: EndPoints.getUsers,
      query: {},
    ).then((value) {
      for (int i = 0; i < value.data.length; i++) {
        users.add(UserModel.fromJson(value.data[i]));
      }
      print('********************************************************');
      print(value.data);
      print('********************************************************');
      emit(GetUsersSuccessState());
    }).catchError((e) {
      print('$e **************************************');
      emit(GetUsersErrorState());
    });
  }

  // get todos ***********************************************************
  List<TodoModel> todos = [];
  int apiPage = 1;
  void getTodos() async {
    emit(GetTodosLoadingState());
    DioService.getData(
      url: EndPoints.getTodos,
      query: {
        '_limit' : 100,
        '_page' : apiPage,
      },
    ).then((value) {
      for (int i = 0; i < value.data.length; i++) {
        todos.add(TodoModel.fromJson(value.data[i]));
      }
      print('********************************************************');
      print(value.data);
      print('********************************************************');
      emit(GetTodosSuccessState());
      apiPage++;
      print('************************************************');
      print(apiPage);
      print('************************************************');
    }).catchError((e) {
      print('$e **************************************');
      emit(GetTodosErrprState());
    });
  }
}
