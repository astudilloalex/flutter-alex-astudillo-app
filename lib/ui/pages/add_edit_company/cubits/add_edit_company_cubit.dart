import 'package:alex_astudillo/src/company/application/company_service.dart';
import 'package:alex_astudillo/src/company/domain/company.dart';
import 'package:alex_astudillo/src/country/application/country_service.dart';
import 'package:alex_astudillo/src/country/domain/country.dart';
import 'package:alex_astudillo/src/person/domain/person.dart';
import 'package:alex_astudillo/src/person_document_type/application/person_document_type_service.dart';
import 'package:alex_astudillo/src/person_document_type/domain/person_document_type.dart';
import 'package:alex_astudillo/ui/pages/add_edit_company/states/add_edit_company_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEditCompanyCubit extends Cubit<AddEditCompanyState> {
  AddEditCompanyCubit({
    this.companyCode,
    required this.companyService,
    required this.countryService,
    required this.personDocumentTypeService,
  }) : super(const AddEditCompanyState());

  final String? companyCode;
  final CompanyService companyService;
  final CountryService countryService;
  final PersonDocumentTypeService personDocumentTypeService;

  Company? company;
  Person? person;

  Future<List<Country>> get countries {
    return countryService.all(active: true);
  }

  Future<List<PersonDocumentType>> personDocumentTypes(String countryCode) {
    return personDocumentTypeService.getByCountryCode(countryCode, true);
  }
}
