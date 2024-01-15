import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notescubit/bloc/notes_bloc.dart';
import 'package:notescubit/data_base/db_helper.dart';
import 'package:notescubit/screens/home_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotesBloc>(
      create: (_)=>NotesBloc(dbHelper: DbHelper.instance),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeBloc(),
      ),
    );
  }
}

