import 'package:rxdart/rxdart.dart';
import 'package:testapp_refactory/model/getDataModel.dart';
import 'package:testapp_refactory/repository/repository.dart';

class DataBloc {
  Repository _repository = Repository();

  final _dataFetcher = PublishSubject<GetDataModel>();

  Observable<GetDataModel> get data => _dataFetcher.stream;

  getData() async {
    GetDataModel dataResponse = await _repository.getData();
    _dataFetcher.sink.add(dataResponse);
  }

  dispose() {
    _dataFetcher.close();
  }
}

final dataBloc = DataBloc();
