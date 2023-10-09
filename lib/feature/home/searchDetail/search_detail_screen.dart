import 'package:case_study/core/api/api_constants.dart';
import 'package:case_study/feature/home/home_provider.dart';
import 'package:case_study/product/constat/string_constants.dart';
import 'package:case_study/product/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/custom_router.dart';

class SearchDetailScreen extends ConsumerStatefulWidget {
  const SearchDetailScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchDetailScreenState();
}

class _SearchDetailScreenState extends ConsumerState<SearchDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.searchDetails),
        actions: const [],
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: RawMaterialButton(
        onPressed: () {
          ref.read(homeProvider.notifier).fetctExerciseList("");
          CustomRouter.pop();
        },
        elevation: 2.0,
        fillColor: Colors.blueGrey,
        padding: const EdgeInsets.all(15.0),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.navigate_before,
          size: 25.0,
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          StringConstants.selectMuscle.toUpperCase(),
                          style: CustomTextStyle.mediumTitle,
                        ),
                        ListView.builder(
                          itemCount: ApiConstants.muscleList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox.adaptive(
                                  visualDensity: VisualDensity.compact,
                                  value: (ref
                                      .watch(homeProvider)
                                      .selectedMuscleList
                                      .contains(ApiConstants.muscleList[index])),
                                  onChanged: (value) {
                                    if (value != null && value == true) {
                                      ref.read(homeProvider.notifier).addSelectedMuscle(ApiConstants.muscleList[index]);
                                    }
                                    if (value != null && value == false) {
                                      ref
                                          .read(homeProvider.notifier)
                                          .removeSelectedMuscle(ApiConstants.muscleList[index]);
                                    }
                                  },
                                ),
                                Text(ApiConstants.muscleList[index])
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          StringConstants.selectType.toUpperCase(),
                          style: CustomTextStyle.mediumTitle,
                        ),
                        DropdownButton<String>(
                          value: ref.watch(homeProvider).type,
                          items: ApiConstants.typeList
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            ref.read(homeProvider.notifier).setType(value ?? "");
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
