import 'package:clean_code_architechture/utils/routes/routes.dart';
import 'package:clean_code_architechture/utils/routes/routes_name.dart';
import 'package:clean_code_architechture/view_model/auth_view_model.dart';
import 'package:clean_code_architechture/view_model/movies_list_view_model.dart';
import 'package:clean_code_architechture/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RouteNames.home,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
