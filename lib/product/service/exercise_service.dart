import 'package:case_study/product/model/exercise_model.dart';

import '../../core/api/http_manager.dart';

class ExerciseService {
  static Future<List<ExerciseModel>> fetchExerciseList(String name) async {
    List<ExerciseModel> exerciseList = [];
    Map<String, String> parameters = {"name": name};
    dynamic response = await HttpManager.get(parameters);
    if (response != null) {
      for (var item in response) {
        exerciseList.add(ExerciseModel.fromJson(item!));
      }
    }
    return exerciseList;
  }

  static Future<List<String>> fetchSuggestionList(String name) async {
    List<String> suggestionList = [];
    Map<String, String> parameters = {"name": name};
    dynamic response = await HttpManager.get(parameters);
    if (response != null) {
      for (var item in response) {
        String suggestionName = ExerciseModel.fromJson(item!).name ?? "";
        suggestionList.add(suggestionName);
      }
    }
    return suggestionList;
  }
}
