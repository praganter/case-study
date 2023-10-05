import 'package:case_study/core/extensions/context_extension.dart';
import 'package:case_study/product/constats/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            title: const Text(StringConstants.home),
            expandedHeight: context.deviceHeight / 7,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(context.deviceHeight / 14),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(StringConstants.home),
                      Text(StringConstants.home),
                    ],
                  ),
                  Row(
                    children: [
                      Text(StringConstants.home),
                      Text(StringConstants.home),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item ${1 + index}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
