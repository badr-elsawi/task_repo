import 'package:api_test/models/todo.dart';
import 'package:api_test/models/user.dart';
import 'package:api_test/screens/home_screen/todo_item.dart';
import 'package:api_test/screens/home_screen/user_item.dart';
import 'package:api_test/shared/cubits/todo_cubit/todo_cubit.dart';
import 'package:api_test/shared/cubits/todo_cubit/todo_state.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = TodoCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (cubit.page == 0)
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: 10.h,
                      ),
                      child: Text(
                        'Filter by user',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  if (cubit.page == 0)
                    Animate(
                      effects: [
                        FadeEffect(
                          duration: Duration(milliseconds: 300),
                          delay: Duration(milliseconds: 200),
                        ),
                      ],
                      child: Container(
                        height: 130.h,
                        padding: EdgeInsetsDirectional.only(
                          start: 10.w,
                          end: 10.w,
                          top: 10.h,
                          bottom: 5.h,
                        ),
                        child: UsersItemsList(users: cubit.users),
                      ),
                    ),
                  if (cubit.page == 0)
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: 0.h,
                        bottom: 10.h,
                      ),
                      child: Text(
                        cubit.selectedId == null
                            ? 'All Todos'
                            : 'All Todos for ${cubit.users[cubit.selectedId! - 1].name}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ConditionalBuilder(
                    condition:
                        cubit.todos.isNotEmpty || state is GetTodosLoadingState,
                    builder: (context) {
                      return !cubit.isFiltered
                          ? Listo(
                              list: cubit.todos
                                  .getRange(cubit.getStart(), cubit.getEnd())
                                  .toList())
                          : Listo(
                              list: cubit.filteredList,
                            );
                    },
                    fallback: (context) => Center(
                      child: CupertinoActivityIndicator(
                        radius: 15.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomSheet: !cubit.isFiltered
              ? Animate(
                  effects: [
                    FadeEffect(
                      duration: Duration(milliseconds: 300),
                    ),
                  ],
                  child: Container(
                    // height: 50.h,
                    margin: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 10.h,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(50).w,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.w,
                        )),
                    child: NumberPaginator(
                      numberPages: 5,
                      initialPage: 0,
                      onPageChange: (newPage) {
                        if (newPage > 1 && cubit.apiPage == 2) cubit.getTodos();

                        cubit.changePage(newPage);
                      },
                      config: NumberPaginatorUIConfig(
                        height: 35.h,
                        buttonSelectedBackgroundColor:
                            Colors.teal.withOpacity(0.5),
                        buttonUnselectedForegroundColor: Colors.white,
                      ),
                    ),
                  ),
                )
              : null,
        );
      },
    );
  }
}

class Listo extends StatelessWidget {
  final List<TodoModel> list;

  const Listo({
    required this.list,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsetsDirectional.only(
          top: 10.h, bottom: 80.h, start: 10.w, end: 10.w),
      itemBuilder: (context, index) => TodoItem(
        todo: list[index],
        user: TodoCubit.get(context).users[(list[index].userId) - 1],
      ),
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
      itemCount: list.length,
    );
  }
}

class UsersItemsList extends StatelessWidget {
  final List<UserModel> users;

  const UsersItemsList({required this.users, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => UserItem(user: users[index]),
      separatorBuilder: (context, index) => SizedBox(
        width: 20.w,
      ),
      itemCount: users.length,
    );
  }
}
