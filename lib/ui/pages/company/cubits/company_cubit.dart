import 'package:alex_astudillo/src/company/application/company_service.dart';
import 'package:alex_astudillo/ui/pages/company/states/company_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit({
    required this.companyService,
  }) : super(const CompanyState());

  final CompanyService companyService;
}
