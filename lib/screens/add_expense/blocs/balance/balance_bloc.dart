import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'balance_event.dart';
part 'balance_state.dart';	


class TextBloc extends Bloc<TextEvent, TextState> {
  
  TextBloc(BuildContext context) : super(TextStateInitial(sum:0)) {
    
    on<updatesum>(( updatesum event,Emitter<TextState> emit) {
      int tempo = state.sum+20 ;
      emit(TextStateUpdated( sum:tempo));
     
    });
     
    
  } 
}
