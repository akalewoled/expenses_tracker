import 'package:expense_repository/expense_repository.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chart.dart';

class StatScreen extends StatelessWidget {
        final List<Expense> expenses;
  
      TextEditingController balanceController = TextEditingController();
  


   StatScreen(this.expenses, {super.key});
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'performance',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
              ),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(12, 20, 12, 12),
                child: MyChart(),
              )
            ),
                        Text(
                          DateFormat('dd/MM/yyyy').format(DateTime(2017,9,7)),
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.bold
                    ),
                  ),
      
            Expanded(
                  child: ListView.builder(
                    itemCount: expenses.length,
                    itemBuilder: (context, int i) {
                    

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
                

          ],
        ),
      ),
    );
  }
}