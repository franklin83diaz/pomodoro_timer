import 'package:flutter_bloc/flutter_bloc.dart';

class UnixtimeCubit extends Cubit<int> {
  UnixtimeCubit() : super(0);

  void reset() => emit(0);

  bool runing = false;

  void start() async {
    if (runing) return;
    runing = true;
    for (int i = 0; i < (25 * 60); i++) {
      await Future.delayed(const Duration(seconds: 1));
      emit(state + 1);
    }
    runing = false;
  }
}
