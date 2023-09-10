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
  /*
    when changing the page the range of the list changing
    range is specified by start and end which we get from getStart() and getEnd() functions
  */

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
  /*
    selectedId variable refers to the user id we want to display his todos list
    if the todos list is not completely fetched getTodos() is called
    when filtering is performed pagination bar is hidden and all the users todos is shown in one single list
  */
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
  /*
    get the users data and save it to use in todos item cuz todos come with only the user id
    date come as a list of users so i add them directly to users list
  */
  List<UserModel> users = [];
  void getUsers() async {
    DioService.getData(
      url: EndPoints.getUsers,
      query: {},
    ).then((value) {
      for (int i = 0; i < value.data.length; i++) {
        users.add(UserModel.fromJson(value.data[i]));
      }
      emit(GetUsersSuccessState());
    }).catchError((e) {
      emit(GetUsersErrorState());
    });
  }

  // get todos ***********************************************************
  /*
    get todos data and store it in the todos list
    data come in two in steps each step we get 100 items
    data divided in two pages each page has 100 items
    apiPage variable refers to the data page
    when cubit being created the getTodos() function being called , apiPage = 1
    and after fetching the first 100 items the page increment by 1
    when the UI needs to display the rest items the getTodos() function is recalled
    when the user moves to any page more than 3 or when he perform filter by user
  */
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
      emit(GetTodosSuccessState());
      apiPage++;
    }).catchError((e) {
      emit(GetTodosErrprState());
    });
  }
}
