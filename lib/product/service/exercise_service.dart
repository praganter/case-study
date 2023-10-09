import 'package:case_study/product/model/exercise_model.dart';

import '../../core/api/http_manager.dart';

class ExerciseService {
  static Future<List<ExerciseModel>> fetchExerciseList(String name, String type) async {
    List<ExerciseModel> exerciseList = [];
    Map<String, String> parameters = {"name": name};
    if (type.isNotEmpty) parameters.putIfAbsent("type", () => type);
    dynamic response = await HttpManager.get(parameters);
    if (response != null) {
      for (var item in response) {
        exerciseList.add(ExerciseModel.fromJson(item!));
      }
    }
    return exerciseList;
  }
}
