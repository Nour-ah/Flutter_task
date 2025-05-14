// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/network/product_api.dart';
import 'package:task/data/repository/product_repo.dart';
import 'package:task/view/cubit/product_cubit.dart';
import 'package:task/view/screens/homepage.dart';

void main() {
  final repository = ProductRepository(ApiProduct());
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final ProductRepository repository;
  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => ProductCubit(repository)..getProducts(),
        child: HomePage(),
      ),
    );
  }
}
