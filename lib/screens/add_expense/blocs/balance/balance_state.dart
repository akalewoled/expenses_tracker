part of 'balance_bloc.dart';
abstract class TextState {
   int sum =0 ;
  TextState({required this.sum});
}

class TextStateInitial extends TextState {
  TextStateInitial({required int sum}): super(sum:sum);

}

class TextStateUpdated extends TextState {
  
  TextStateUpdated({required int sum}): super(sum:sum);
}
