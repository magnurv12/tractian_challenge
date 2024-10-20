import 'dart:convert';

import 'package:dependencies/dependencies.dart' as http;

import '../models/models.dart';

/// An abstract class that defines the contract for a data source.
///
/// This class provides a method to fetch a list of companies.
///
/// Methods:
/// - `Future<List<CompanyModel>> getCompanies()`: Fetches a list of companies.
abstract class IDataSource {
  /// Fetches a list of companies.
  Future<List<CompanyModel>> getCompanies();

  /// Fetches a list of tree nodes by company id.
  Future<List<TreeNodeModel>> getLocations(String companyId);

  /// Fetches a list of tree nodes by company id.
  Future<List<TreeNodeModel>> getAssets(String companyId);
}

/// A remote data source that fetches data from an API.
class RemoteDataSource implements IDataSource {
  final Uri _apiUrl;

  /// Creates a [RemoteDataSource]
  RemoteDataSource(this._apiUrl);

  static const _companiesPath = '/companies';

  @override
  Future<List<CompanyModel>> getCompanies() async {
    final url = _apiUrl.replace(path: _companiesPath);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((company) => CompanyModel.fromJson(company)).toList();
    } else {
      throw Exception('Failed to load companies');
    }
  }

  @override
  Future<List<TreeNodeModel>> getAssets(String companyId) async {
    final url = _apiUrl.replace(path: '$_companiesPath/$companyId/assets');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((asset) => TreeNodeModel.fromJson(asset)).toList();
    } else {
      throw Exception('Failed to load assets');
    }
  }

  @override
  Future<List<TreeNodeModel>> getLocations(String companyId) async {
    final url = _apiUrl.replace(path: '$_companiesPath/$companyId/locations');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((location) => TreeNodeModel.fromJson(location)).toList();
    } else {
      throw Exception('Failed to load locations');
    }
  }
}
