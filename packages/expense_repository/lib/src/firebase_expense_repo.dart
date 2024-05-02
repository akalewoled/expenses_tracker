import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/expense_repository.dart';

class FirebaseExpenseRepo implements ExpenseRepository {
  final categoryCollection = FirebaseFirestore.instance.collection('categories');
	final expenseCollection = FirebaseFirestore.instance.collection('expenses');
  final usercollection= FirebaseFirestore.instance.collection('users');


  @override
  Future<void> createCategory(Category category) async {
    try {
      await categoryCollection
        .doc(category.categoryId)
        .set(category.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  @override
Future<void> deleteCategory(Category category) async {
    try {
      await categoryCollection
        .doc(category.categoryId)
        .delete();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  @override
  Future<List<Category>> getCategory() async {
    try {
      return await categoryCollection
        .get()
        .then((value) => value.docs.map((e) => 
          Category.fromEntity(CategoryEntity.fromDocument(e.data()))
        ).toList());
    } catch (e) { 
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> createExpense(Expense expense) async {
    try {
       return await expenseCollection
        .doc(expense.expenseId)
        .set(expense.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  
  @override
  Future<void> deleteExpense(Expense expense) async {
    try {
       return await expenseCollection
        .doc(expense.expenseId)
        .delete();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }


  @override
  Future<List<Expense>> getExpenses() async {
    try {
      return await expenseCollection
        .get()
        .then((value) => value.docs.map((e) => 
          Expense.fromEntity(ExpenseEntity.fromDocument(e.data()))
        ).toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  @override
  Future<users> getusers( ) async{
    try{
      return await usercollection.doc('D0FuFW9TExYc58r53dlr').get().then((userDoc) => users.fromEntity(userEntity.fromDocument({
        'username': userDoc['username'],
      
      })));
    }
    catch (e){
      log(e.toString());
      rethrow;

    }

  }

}