import 'package:case_study/feature/program/program_provider.dart';
import 'package:case_study/product/base/custom_navigation_bar.dart';
import 'package:case_study/product/constat/string_constants.dart';
import 'package:case_study/product/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProgramScreen extends ConsumerStatefulWidget {
  const ProgramScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProgramScreenState();
}

class _ProgramScreenState extends ConsumerState<ProgramScreen> {
  @override
  void initState() {
    Future.microtask(() => ref.read(programProvider.notifier).fetchExerciseMapList(StringConstants.exerciseBox));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavigationBar(
        currentIndex: 1,
      ),
      appBar: AppBar(
        title: Column(
          children: [
            const Text(
              StringConstants.programs,
              style: CustomTextStyle.mediumTitle,
            ),
            Text(StringConstants.selectedProgram + ref.watch(programProvider).title),
          ],
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _ProgramsRow(),
          Flexible(
            flex: 9,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  ref.watch(programProvider).selectedExerciseList.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.deepPurple,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "asd",
                                      // StringConstants.name + ref.read(homeProvider).exerciseList[index].name!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "asd",
                                    ),
                                    Text(
                                      "asd",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgramsRow extends ConsumerWidget {
  const _ProgramsRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flexible(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            ref.watch(programProvider).programList.length,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                splashColor: Colors.transparent,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {
                  ref.read(programProvider.notifier).setTitle(index);
                },
                child: Chip(
                  color: MaterialStateProperty.all(Colors.blueGrey),
                  label: Text(ref.watch(programProvider).programList[index]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
