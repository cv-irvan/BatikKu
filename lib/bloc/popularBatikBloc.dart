import 'package:batikku/model/popularBatikModel.dart';
import 'package:batikku/provider/repository.dart';
import 'package:rxdart/subjects.dart';

class PopularBatikBloc {
  final _repository = Repository();
  final _popularBatikFatcher = PublishSubject<PopolarBatikModel>();

  PublishSubject<PopolarBatikModel> get popularbatik =>
      _popularBatikFatcher.stream;

  getPopularBatik() async {
    PopolarBatikModel popolarBatikModel = await _repository.api.popularBatik();
    _popularBatikFatcher.sink.add(popolarBatikModel);
  }

  dispose() {
    _popularBatikFatcher.close();
  }
}

final blocPopularBatik = PopularBatikBloc();
