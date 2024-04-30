import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_balance_event.dart';
part 'update_balance_state.dart';

class updatebalanceblock extends Bloc<UpdateBalanceEvent, UpdateBalanceState> {

  updatebalanceblock() : super(UpdateBalanceInitial()){
    on<UpdateBalance>((event, emit) async {
      emit(UpdateBalanceLoading());
      try {
        emit(UpdateBalanceSuccess(event.balance));
      } catch (e) {
        emit(UpdateBalanceFailure());
      }
    });
  }
} 