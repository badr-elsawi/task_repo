import 'package:api_test/models/todo.dart';
import 'package:api_test/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoItem extends StatelessWidget {
  final TodoModel todo;
  final UserModel user;

  const TodoItem({
    required this.todo,
    required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      padding: EdgeInsetsDirectional.only(
        top: 8.h,
        bottom: 15.h,
        start: 20.w,
        end: 20.w,
      ),
      decoration: BoxDecoration(
        // color: Colors.blue.withOpacity(0.03),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            todo.completed
                ? Color(0xff055434).withOpacity(0.3)
                : Color(0xffF5A90A).withOpacity(0.2),
          ],
        ),
        borderRadius: BorderRadius.circular(20).w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.w,
                backgroundColor: Colors.teal.withOpacity(0.3),
                foregroundColor: Colors.grey[500],
                child: Icon(
                  Icons.person,
                ),
              ),
              SizedBox(width: 15.w),
              Container(
                width: 150.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user.name}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      '${user.username}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.mail),
              ),
              SizedBox(width: 5.w),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.call),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            '${todo.title}',
            style: Theme.of(context).textTheme.bodyLarge,
            maxLines: 3,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 5.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(50).w,
                  border: Border.all(
                    color: todo.completed ? Colors.green : Colors.amber,
                    width: 1.w,
                  ),
                ),
                child: Text(
                  todo.completed ? 'complated' : 'in progress',
                  style: Theme.of(context).textTheme.bodySmall!.merge(TextStyle(
                        color: todo.completed ? Colors.green : Colors.amber,
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
