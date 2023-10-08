import 'package:case_study/core/api/api_constants.dart';
import 'package:case_study/core/extension/context_extension.dart';
import 'package:case_study/feature/home/home_provider.dart';
import 'package:case_study/product/base/custom_navigation_bar.dart';
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
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomNavigationBar(
          currentIndex: 0,
        ),
        body: CustomScrollView(
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
                        color: Colors.grey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("name  : ${ref.read(homeProvider).exerciseList[index].name!}"),
                            Text("type  : ${ref.read(homeProvider).exerciseList[index].type!}"),
                            Text("muscle  : ${ref.read(homeProvider).exerciseList[index].muscle!}"),
                            const Text("data"),
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
      expandedHeight: context.deviceHeight / 4,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(context.deviceHeight / 6.5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
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
                        await showBottomSheet(context);
                      },
                    ),
                  ), // Add more icons as needed
                ],
              ),
              Text((ref.read(homeProvider).exerciseList.length).toString() + StringConstants.resultsFound),
            ],
          ),
        ),
      ),
    );
  }

  showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      useSafeArea: true,
      // showDragHandle: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text("Select Type of exercise and target Muscles"),
            ),
          ),
          const Text("data"),
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        for (var i = 0; i < ApiConstants.muscleList.length; i++)
                          Chip(label: Text(ApiConstants.muscleList[i]))
                      ],
                    ),
                    Column(
                      children: [for (var i = 0; i < ApiConstants.typeList.length; i++) const Text("asdsa")],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
