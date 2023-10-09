import 'package:alex_astudillo/src/company/application/company_service.dart';
import 'package:alex_astudillo/src/company/domain/company.dart';
import 'package:alex_astudillo/src/person/domain/person.dart';
import 'package:alex_astudillo/ui/pages/add_edit_company/states/add_edit_company_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEditCompanyCubit extends Cubit<AddEditCompanyState> {
  AddEditCompanyCubit({
    this.code,
    required this.companyService,
  }) : super(const AddEditCompanyState());

  final String? code;
  final CompanyService companyService;

  Company? company;
  Person? person;
}
