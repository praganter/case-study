import 'package:case_study/product/constat/string_constants.dart';
import 'package:case_study/product/model/exercise_model.dart';
import 'package:hive/hive.dart';

final class HiveService {
  HiveService();
  static openBoxes() async {
    await Hive.openBox(StringConstants.programBox);
    await Hive.openBox(StringConstants.exerciseBox);
  }

  static addNewProgram(String boxName, String item) async {
    var box = Hive.box(boxName);
    box.add(item);
  }

  static addExerciseToProgram(String programName, ExerciseModel item) async {
    final box = Hive.box(StringConstants.exerciseBox);
    final exercisesMap = box.get(programName, defaultValue: {});
    exercisesMap[programName]!.add(item);
    await box.put(programName, exercisesMap);
  }

  static Future<List<T>> getListByBoxName<T>(String boxName) async {
    var box = Hive.box(boxName);
    List<T> items = (box.toMap().values.toList()).map((e) => e as T).toList();
    return items;
  }

  static List<Map<String, List<ExerciseModel>>> getExerciseList(String boxName) {
    var box = Hive.box(boxName);
    var items = (box.toMap().values.toList().cast<Map<String, List<ExerciseModel>>>());
    return items;
  }

  // static
}
