import 'package:case_study/core/extension/context_extension.dart';
import 'package:case_study/core/utils/custom_router.dart';
import 'package:case_study/feature/home/home_provider.dart';
import 'package:case_study/product/base/custom_navigation_bar.dart';
import 'package:case_study/product/constat/page_routes_constants.dart';
import 'package:case_study/product/constat/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController searchTec = TextEditingController();

  @override
  void initState() {
    super.initState();
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
            const HomeSliverAppBar(),
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
                                        "Name : ${ref.read(homeProvider).exerciseList[index].name!}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text("Type : ${ref.read(homeProvider).exerciseList[index].type!}"),
                                      Text("Muscle : ${ref.read(homeProvider).exerciseList[index].muscle!}"),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconButton(
                                        onPressed: () async {},
                                        icon: const Icon(
                                          Icons.add_rounded,
                                          color: Colors.black,
                                        ),
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeSliverAppBar extends ConsumerWidget {
  const HomeSliverAppBar({
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
                      fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                        return TextField(
                          controller: textEditingController,
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
                            onDeleted: () => ref.read(homeProvider.notifier).setType(""),
                          ),
                        ),
                      Row(
                        children: List.generate(
                          ref.watch(homeProvider).selectedMuscleList.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Chip(
                              label: Text(ref.watch(homeProvider).selectedMuscleList[index]),
                              onDeleted: () => ref
                                  .read(homeProvider.notifier)
                                  .removeSelectedMuscle(ref.read(homeProvider).selectedMuscleList[index]),
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
