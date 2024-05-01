

//import 'dart:js';
import 'dart:math';

import 'package:expense_repository/expense_repository.dart';
import 'package:expenses_tracker/screens/add_expense/blocs/balance/balance_bloc.dart';
import 'package:expenses_tracker/screens/home/blocs/get_expenses_bloc/get_expenses_bloc.dart';

import 'package:expenses_tracker/screens/add_expense/blocs/deleteexpense/deleterxpense_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../data/data.dart';

class MainScreen extends StatelessWidget {
      final List<Expense> expenses;
  
      TextEditingController balanceController = TextEditingController();
  

       MainScreen(this.expenses, {super.key});

  
       int sum = 0;
        int caclulate(){
            for (int i = 0; i < this.expenses.length; i++) {
                    sum += expenses[i].amount;
                      }
            return sum;
            
            }
      

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<TextBloc>(
        
        
                    create: (context) => TextBloc(context),
                          
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
          child: Column(
            children: [
             
             // profile 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.yellow[700]
                            ),
                          ),
                          Icon(
                            CupertinoIcons.person_fill,
                            color: Colors.yellow[800],
                          )
                        ],
                      ),
                      const SizedBox(width: 8,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome!",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.outline
                            ),
                          ),
                          Text(
                            "fikiremariyam ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onBackground
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  IconButton(onPressed: () {
                    int sum1 =caclulate();
                  }, icon: const Icon(CupertinoIcons.settings))
                ],
              ),
              const SizedBox(height: 20,),
              Container(
                
        
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.tertiary,
                    ],
                    transform: const GradientRotation(pi / 4),
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Colors.grey.shade300,
                      offset: const Offset(5, 5)
                    )
                  ]
                ),
            
                // balance tab
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Total credit balance',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(height: 12),
                     BlocBuilder<TextBloc, TextState>(
                                   builder: (context, state)  {
                                    if (state is TextStateInitial) {
                                      int sum1 =caclulate();
                                       
                                return Text(
                                  //sum.toString(),
                                sum1.toString(),
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),
                                                 );
                                    } else if (state is TextStateUpdated) {
                                      return Text(
                                        "${state.sum}",
                                        style: TextStyle(
                                          fontSize: 40,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                        ),
                                      );
                                    } else {
                                      return Text(
                                        "1234",
                                        style: TextStyle(
                                          fontSize: 40,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                        ),
                                      );
                                    } 
          }),
                          
                
                                    ],
                     ),
                  
                ),
              
              const SizedBox(height: 40),
              
              // title of list of expenes 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Expenses',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.outline,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  )
                ],
              ),
              
              const SizedBox(height: 20),
              // the list of expenses
              BlocListener<TextBloc, TextState>(
                listener: (context, state) {
                  if (state is TextStateUpdated) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Balance updated ${context.read<TextBloc>().state.sum}"),
                        duration: const Duration(seconds: 2),
                      ) 
                    );
                  }
                },
              
                child: Expanded(
                  child: ListView.builder(
                    itemCount: expenses.length,
                    itemBuilder: (context, int i) {
                    
                      sum=context.read<TextBloc>().state.sum+expenses[i].amount;
                     TextBloc(context).add(updatesum(sum: sum));

                      return Padding(   
                        
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: GestureDetector(
                              onLongPress: () {
                                showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        title: const Text('do you want to delte this expense?'),
                                        //content: const Text('Category name must be at least 5 characters long and icon must be selected'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              context.read<DeleteexpenseBloc>().add(DeleteExpense(expenses[i]));
                                              Navigator.pop(ctx);
                                            },
                                            child: const Text('OK'),
                                          )
                                        ],
                                      );
                                    }
                                  );

                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Stack(
                                  
                              
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Color(expenses[i].category.color),
                                              shape: BoxShape.circle
                                            ),
                                          ),
                                          Image.asset(
                                            'assets/${expenses[i].category.icon}.png',
                                            scale: 2,
                                            color: Colors.white,
                                            
                                          )
                                        ],
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        expenses[i].category.name,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).colorScheme.onBackground,
                                          fontWeight: FontWeight.w500
                                          
                                        ),
                                        
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        " ${expenses[i].amount}.00 Birr",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).colorScheme.onBackground,
                                          fontWeight: FontWeight.w400
                                        ),
                                      ),
                                      Text(
                                        DateFormat('dd/MM/yyyy').format(expenses[i].date),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).colorScheme.outline,
                                          fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                ),
                
              )
          
          ],
          ),
        ),
      
      ),
    );
  }
}