part of 'deleterxpense_bloc.dart';

sealed class DeleteexpenseState extends Equatable {
  const DeleteexpenseState();
  
  @override
  List<Object> get props => [];
}

final class DeleterxpenseInitial extends DeleteexpenseState {}

final class deleteExpenseFailure extends DeleteexpenseState {}
final class deleteExpenseLoading extends DeleteexpenseState {}
final class deleteExpenseSuccess extends DeleteexpenseState {}
