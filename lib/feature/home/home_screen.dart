import 'package:case_study/core/extension/context_extension.dart';
import 'package:case_study/core/utils/custom_router.dart';
import 'package:case_study/feature/home/home_provider.dart';
import 'package:case_study/product/base/custom_navigation_bar.dart';
import 'package:case_study/product/constat/page_routes_constants.dart';
import 'package:case_study/product/constat/string_constants.dart';
import 'package:case_study/product/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../program/program_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController searchTec = TextEditingController();
  final TextEditingController itemTec = TextEditingController();

  @override
  void initState() {
    Future.microtask(() => ref.read(programProvider.notifier).fetchProgramList(StringConstants.programBox));
    super.initState();
  }

  @override
  void dispose() {
    searchTec.dispose();
    itemTec.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavigationBar(
        currentIndex: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          shrinkWrap: true,
          anchor: 0.7,
          slivers: [
            HomeSliverAppBar(
              searchTec: searchTec,
            ),
            if (ref.watch(homeProvider).isLoading)
              const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: ref.watch(homeProvider).exerciseList.length,
                (context, index) {
                  return _ExerciseContainer(
                    index: index,
                    itemTec: itemTec,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExerciseContainer extends ConsumerWidget {
  final int index;
  final TextEditingController itemTec;
  const _ExerciseContainer({required this.index, required this.itemTec});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blueGrey,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringConstants.name + ref.read(homeProvider).exerciseList[index].name!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(StringConstants.type + ref.read(homeProvider).exerciseList[index].type!),
                        Text(StringConstants.muscle + ref.read(homeProvider).exerciseList[index].muscle!),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        PopupMenuButton(
                          icon: const Icon(Icons.add),
                          itemBuilder: (context) {
                            return [
                              for (var i = 0; i < ref.watch(programProvider).programList.length; i++)
                                PopupMenuItem(
                                  child: Text(
                                    ref.watch(programProvider).programList[i],
                                  ),
                                  onTap: () {
                                    ref.read(programProvider.notifier).addExerciseToProgram(
                                        ref.read(programProvider).programList[i],
                                        ref.read(homeProvider).exerciseList[index]);
                                  },
                                ),
                              PopupMenuItem(
                                onTap: () async {
                                  await showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Material(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context).padding.bottom +
                                                  MediaQuery.of(context).viewInsets.bottom),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(top: 10.0),
                                                child: Text(
                                                  StringConstants.nameOfNewProgram,
                                                  style: CustomTextStyle.mediumTitle,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                                                child: TextField(
                                                  controller: itemTec,
                                                  autocorrect: false,
                                                ),
                                              ),
                                              ElevatedButton(
                                                child: const Text(StringConstants.addNew),
                                                onPressed: () async {
                                                  await ref
                                                      .read(programProvider.notifier)
                                                      .addProgram(StringConstants.programBox, itemTec.text);
                                                  itemTec.clear();
                                                  CustomRouter.pop();
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const Text(
                                  StringConstants.addNew,
                                ),
                              ),
                            ];
                          },
                        ),
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

class HomeSliverAppBar extends ConsumerWidget {
  final TextEditingController searchTec;
  const HomeSliverAppBar({
    required this.searchTec,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      title: const Text(StringConstants.home),
      centerTitle: true,
      expandedHeight: (ref.watch(homeProvider).type != "" || ref.watch(homeProvider).selectedMuscleList.isNotEmpty)
          ? (context.deviceHeight / 4)
          : (context.deviceHeight / 6),
      bottom: PreferredSize(
        preferredSize: (ref.watch(homeProvider).type != "" || ref.watch(homeProvider).selectedMuscleList.isNotEmpty)
            ? Size.fromHeight(context.deviceHeight / 6)
            : Size.fromHeight(context.deviceHeight / 12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Autocomplete<String>(
                      optionsBuilder: ((TextEditingValue textEditingValue) async {
                        await ref.read(homeProvider.notifier).fetctExerciseList(textEditingValue.text);
                        return ref.read(homeProvider).suggestionList;
                      }),
                      onSelected: (option) {
                        ref.read(homeProvider.notifier).fetctExerciseList(option);
                      },
                      fieldViewBuilder: (context, searchTec, focusNode, onFieldSubmitted) {
                        return TextField(
                          controller: searchTec,
                          focusNode: focusNode,
                          onEditingComplete: onFieldSubmitted,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            contentPadding: context.paddingAutoComplete,
                            fillColor: Colors.blueGrey,
                            filled: true,
                            hintText: "Search",
                            isCollapsed: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(color: Colors.blueGrey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(color: Colors.blueGrey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(color: Colors.blueGrey),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      visualDensity: VisualDensity.compact,
                      color: Colors.blueGrey,
                      icon: const Icon(Icons.menu_open_rounded),
                      onPressed: () async {
                        CustomRouter.pushNamed(PageRoutesConstant.searchdetailsPath);
                      },
                    ),
                  ), // Add more icons as needed
                ],
              ),
              if (ref.watch(homeProvider).type != "" || ref.watch(homeProvider).selectedMuscleList.isNotEmpty)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => ref.read(homeProvider.notifier).clearAllFilters(),
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                      ),
                      if (ref.watch(homeProvider).type != "")
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Chip(
                            label: Text(ref.watch(homeProvider).type),
                            onDeleted: () async {
                              ref.read(homeProvider.notifier).setType("");
                              await ref.read(homeProvider.notifier).fetctExerciseList(searchTec.text);
                            },
                          ),
                        ),
                      Row(
                        children: List.generate(
                          ref.watch(homeProvider).selectedMuscleList.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Chip(
                              label: Text(ref.watch(homeProvider).selectedMuscleList[index]),
                              onDeleted: () async {
                                ref
                                    .read(homeProvider.notifier)
                                    .removeSelectedMuscle(ref.read(homeProvider).selectedMuscleList[index]);
                                await ref.read(homeProvider.notifier).fetctExerciseList(searchTec.text);
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              Text(
                (ref.watch(homeProvider).exerciseList.length).toString() + StringConstants.resultsFound,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
