import 'package:flutter_dio/api/api_provider.dart';
import 'package:flutter_dio/api/models/post_model/post_model.dart';

class ApiRepository{

  ApiProvider _provider = ApiProvider() ; 


  Future<List<PostModel>> get getDataPostFromApi => _provider.getDataPostFromApiAsync(); 

}