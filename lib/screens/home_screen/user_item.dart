import 'package:api_test/models/user.dart';
import 'package:api_test/shared/cubits/todo_cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserItem extends StatelessWidget {
  final UserModel user;

  const UserItem({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        TodoCubit.get(context).filtered(user.id);
      },
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            // height: 55.w,
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.h),
            decoration: BoxDecoration(
              color: Colors.teal.withOpacity(0.3),
              shape: BoxShape.circle,
              border: Border.all(
                color: TodoCubit.get(context).selectedId == user.id
                    ? Colors.blue
                    : Colors.white,
              ),
            ),
            child: Text(user.name[0]),
          ),
          SizedBox(height: 3.h),
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: 55.w,
            child: Text(
              '${user.name}',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: TodoCubit.get(context).selectedId == user.id
                        ? Colors.blue
                        : Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
