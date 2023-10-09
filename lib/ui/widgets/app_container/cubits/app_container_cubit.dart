import 'package:alex_astudillo/src/common/domain/http_exception.dart';
import 'package:alex_astudillo/src/company/application/company_service.dart';
import 'package:alex_astudillo/ui/widgets/app_container/states/app_container_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppContainerCubit extends Cubit<AppContainerState> {
  AppContainerCubit({
    int currentIndex = 0,
    required this.companyService,
  }) : super(
          AppContainerState(currentIndex: currentIndex),
        );

  final CompanyService companyService;

  Future<String?> load() async {
    try {
      emit(state.copyWith(companies: (await companyService.all(1, 100)).data));
    } on HttpException catch (e) {
      return e.message;
    } on Exception catch (e) {
      return e.toString();
    }
    return null;
  }

  void updateIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  void changeNotifications() {
    emit(state.copyWith(countNotifications: state.countNotifications + 1));
  }
}
