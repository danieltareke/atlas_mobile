import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'smslogin_event.dart';
part 'smslogin_state.dart';

class SmsloginBloc extends Bloc<SmsloginEvent, SmsloginState> {
  SmsloginBloc() : super(SmsloginInitial()) {
    on<SmsloginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
