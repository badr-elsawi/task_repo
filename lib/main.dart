import 'package:api_test/screens/home_screen/home_screen.dart';
import 'package:api_test/shared/cubits/app_cubit/app_cubit.dart';
import 'package:api_test/shared/cubits/app_cubit/app_states.dart';
import 'package:api_test/shared/cubits/todo_cubit/todo_cubit.dart';
import 'package:api_test/shared/remote_services/remote_services.dart';
import 'package:api_test/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AppCubit()),
        BlocProvider(create: (BuildContext context) => TodoCubit()..getUsers()..getTodos()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            // Use builder only if you need to use library outside ScreenUtilInit context
            builder: (_, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Test App',
                theme: darkTheme,
                home: Home(),
              );
            },
          );
        },
      ),
    );
  }
}
