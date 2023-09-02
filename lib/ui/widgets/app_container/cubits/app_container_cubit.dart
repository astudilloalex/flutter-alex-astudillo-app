import 'package:alex_astudillo/ui/widgets/app_container/states/app_container_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppContainerCubit extends Cubit<AppContainerState> {
  AppContainerCubit({int currentIndex = 0})
      : super(
          AppContainerState(currentIndex: currentIndex),
        );

  void updateIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
