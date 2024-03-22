import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObser extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
    super.onCreate(bloc);
    print("bloc - ${bloc.runtimeType}");
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    print(bloc);
  }
}
