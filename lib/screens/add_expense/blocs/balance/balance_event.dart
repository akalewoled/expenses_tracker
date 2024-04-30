
part of 'balance_bloc.dart';
abstract class TextEvent {
  const TextEvent();

  int get props => 0;
}

 class loadsum extends TextEvent {
  final int sum;
 
 const  loadsum(this.sum);

  @override
  int  get props => sum;
 }

class updatesum extends TextEvent {
  final int sum;

  updatesum( { required this.sum});
  @override
  int  get props => sum;
}
