import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'adress_event.dart';
part 'adress_state.dart';

class AdressBloc extends Bloc<AdressEvent, AdressState> {
  AdressBloc() : super(AdressInitial()) {
    on<AdressEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
