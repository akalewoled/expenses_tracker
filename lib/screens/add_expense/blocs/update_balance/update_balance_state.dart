part of 'update_balance_bloc.dart';
sealed class UpdateBalanceState extends Equatable {
  const UpdateBalanceState();
  
  @override
  List<Object> get props => [];
}
class UpdateBalanceInitial extends UpdateBalanceState {}
class UpdateBalanceLoading extends UpdateBalanceState {}
class UpdateBalanceSuccess extends UpdateBalanceState {
  final double balance;

  const UpdateBalanceSuccess(this.balance);

  @override
  List<Object> get props => [balance];
}
class UpdateBalanceFailure extends UpdateBalanceState {}