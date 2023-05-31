import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orel_it/util/injection.dart';
import 'common/loader/config.dart';
import 'common/observer/observer.dart';
import 'feature/presentation/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = NewsBlocObserver(); // Setup global observer to monitor all blocs
  await setupLocators(); // injection setup
  ConfigEasyLoader.darkTheme(); // Set theme for EasyLoader indicator
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, info) {
          return MaterialApp(
            // easy loader initialization
            builder: EasyLoading.init(),
            title: 'Orel IT',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const HomeScreenWrapper(),
          );
        }
    );
  }
}
