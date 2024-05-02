import 'package:expense_repository/expense_repository.dart';

abstract class ExpenseRepository {

  Future<void> createCategory(Category category);
  Future<void> deleteCategory(Category category);

  Future<List<Category>> getCategory();

  Future<void> createExpense(Expense expense);
  
  Future<void> deleteExpense(Expense expense);

  Future<List<Expense>> getExpenses();
  
  Future<users> getusers();
  
}