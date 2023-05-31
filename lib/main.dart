import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orel_it/util/injection.dart';

import 'common/observer/observer.dart';
import 'feature/presentation/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = NewsBlocObserver(); // Setup global observer to monitor all blocs
  await setupLocators();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, info) {
          return MaterialApp(
            title: 'Daily News',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const HomeScreenWrapper(),
          );
        }
    );
  }
}
