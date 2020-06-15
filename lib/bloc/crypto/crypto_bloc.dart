import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  @override
  CryptoState get initialState => CryptoInitial();

  @override
  Stream<CryptoState> mapEventToState(
    CryptoEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
