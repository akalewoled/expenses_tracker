import 'package:expense_repository/expense_repository.dart';
import 'package:expenses_tracker/screens/add_expense/blocs/deleteexpense/deleterxpense_bloc.dart';
import 'package:expenses_tracker/screens/home/blocs/get_expenses_bloc/get_expenses_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/home/views/home_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expense Tracker",
      theme: ThemeData(colorScheme: ColorScheme.light(background: Colors.grey.shade100, onBackground: Colors.black, primary: const Color(0xFF00B2E7), secondary: const Color(0xFFE064F7), tertiary: const Color(0xFFFF8D6C), outline: Colors.grey)),
      home: MultiBlocProvider(
        providers: [
             BlocProvider(
        create: (context) => GetExpensesBloc(
          FirebaseExpenseRepo()
        )..add(GetExpenses())
        ),

          BlocProvider(
            create: (context) => DeleteexpenseBloc(FirebaseExpenseRepo()),
          ),
        ],
        child: const HomeScreen(),
      )
   
      );
    
  }
}
