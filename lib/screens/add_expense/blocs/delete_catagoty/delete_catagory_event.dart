part of 'delete_catagory_bloc.dart';

sealed class DeleteCatagoryEvent extends Equatable {
  const DeleteCatagoryEvent();

  @override
  List<Object> get props => [];
}

class DeleteCatagory extends DeleteCatagoryEvent {
  final Category category;

  const DeleteCatagory(this.category);

  @override
  List<Object> get props => [category];
}