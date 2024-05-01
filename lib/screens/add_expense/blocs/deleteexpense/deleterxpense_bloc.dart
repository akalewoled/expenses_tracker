import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';


part 'deleterxpense_event.dart';
part 'deleterxpense_state.dart';

class DeleteexpenseBloc extends Bloc<DeleteExpenseEvent, DeleteexpenseState> {
    ExpenseRepository expenseRepository;

  DeleteexpenseBloc(this.expenseRepository) : super(DeleterxpenseInitial()) {
    on<DeleteExpense>((event, emit) async {
      emit(deleteExpenseLoading());
      try {
        await expenseRepository.deleteExpense(event.expense);
        emit(deleteExpenseSuccess());
      } catch (e) {
        emit(deleteExpenseFailure());
      }
    });
  }
}
