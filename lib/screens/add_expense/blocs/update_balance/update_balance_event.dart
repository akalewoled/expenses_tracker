part of 'update_balance_bloc.dart';
sealed class UpdateBalanceEvent extends Equatable {
  const UpdateBalanceEvent();
  
  @override
  List<Object> get props => [];
}

class UpdateBalance extends UpdateBalanceEvent {
  final double balance;

  const UpdateBalance(this.balance);

  @override
  List<Object> get props => [balance];
}