import 'package:mafatih/features/agencies/model/agency_data.dart';
import 'package:mafatih/features/agencies/model/pagination.dart';

class AgenciesAndPagination {
  List<AgencyData>? agenciesList;
  Pagination? pagination;

  AgenciesAndPagination({this.agenciesList, this.pagination});

  AgenciesAndPagination.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      agenciesList = <AgencyData>[];
      json['data'].forEach((v) {
        agenciesList!.add(AgencyData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.agenciesList != null) {
      data['data'] = this.agenciesList!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}
