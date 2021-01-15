import 'package:batikku/provider/api.dart';

class Repository {
  final api = Api();

  Future popularBatik() => api.popularBatik();
}
