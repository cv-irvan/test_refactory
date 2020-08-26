import 'package:testapp_refactory/model/getDataModel.dart';
import 'package:testapp_refactory/repository/api.dart';

class Repository {
  ApiProvider api = ApiProvider();

  Future<GetDataModel> getData() => api.getData();
}
