import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:my_gallery_task/domain/repo/main_repo/main_repo.dart';

@Injectable(as: MainRepo)
class MainRepoImpl extends MainRepo {
  static const String baseUrl = 'https://flutter.prominaagency.com/api';

  @override
  Future<List<String>> fetchImages() async {
    final response = await http.get(Uri.parse('$baseUrl/my-gallery'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((image) => image.toString()).toList();
    } else {
      throw Exception('Failed to fetch images');
    }
  }

  @override
  Future<String> uploadImage(File image) async {
    final url = Uri.parse('$baseUrl/upload');
    final request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      final dynamic data = jsonDecode(responseData);
      return data['imageUrl'].toString();
    } else {
      throw Exception('Failed to upload image');
    }
  }
}
