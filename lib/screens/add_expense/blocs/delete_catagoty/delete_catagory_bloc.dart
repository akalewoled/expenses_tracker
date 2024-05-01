import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';

part 'delete_catagory_event.dart';
part 'delete_catagory_state.dart';

class DeleteCatagoryBloc extends Bloc<DeleteCatagoryEvent, DeleteCatagoryState> {
 final ExpenseRepository expenseRepository;

  DeleteCatagoryBloc(this.expenseRepository) : super(DeleteCatagoryInital()) {
    on<DeleteCatagory>(_deleteCategory);
  }


  void _deleteCategory (event, emit) async {
        
        emit(DeleteCategoryLoading());
        try {
          await expenseRepository.deleteCategory(event.category);
          emit(DeleteCategorySuccess());
        } catch (e) {
          emit(DeleteCatagoryFailure());
        } 
      }

      
}