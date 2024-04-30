part of 'delete_catagory_bloc.dart';

sealed class DeleteCatagoryState extends Equatable {
  const DeleteCatagoryState();
  
  @override
  List<Object> get props => [];
}

final class DeleteCatagoryInital extends DeleteCatagoryState {}

final class DeleteCatagoryFailure extends DeleteCatagoryState {}
final class DeleteCategorySuccess extends DeleteCatagoryState {}
final class DeleteCategoryLoading extends DeleteCatagoryState {}
