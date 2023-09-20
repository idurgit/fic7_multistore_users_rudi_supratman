import 'package:dartz/dartz.dart';
import '../../common/global_variables.dart';
import 'package:http/http.dart' as http;
import '../models/banners_response_model.dart';

class BannerRemoteDatasource {
  Future<Either<String, BannersResponseModel>> getBanners() async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/banners'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return Right(BannersResponseModel.fromJson(response.body));
    } else {
      return const Left('Server Error');
    }
  }
}
