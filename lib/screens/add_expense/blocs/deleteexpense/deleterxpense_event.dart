part of 'deleterxpense_bloc.dart';

sealed class DeleteExpenseEvent extends Equatable {
  const DeleteExpenseEvent();

  @override
  List<Object> get props => [];
}

class DeleteExpense extends DeleteExpenseEvent{
  final Expense expense;

  const DeleteExpense(this.expense);

  @override
  List<Object> get props => [expense];
}