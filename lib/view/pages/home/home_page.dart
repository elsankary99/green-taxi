import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/view/widgets/home_widget/bottom_home_widget.dart';
import 'package:green_taxi/view/widgets/home_widget/bottom_sheet_icon.dart';
import 'package:green_taxi/view/widgets/home_widget/build_map.dart';
import 'package:green_taxi/view/widgets/home_widget/home_drawer.dart';
import 'package:green_taxi/view/widgets/home_widget/search_for_location.dart';
import 'package:green_taxi/view/widgets/home_widget/top_home_widget.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const HomeDrawerWidget(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BuildMap(),
          const Positioned(top: 0, child: TopHomeWidget()),
          Positioned(
              bottom: context.height * 0.08,
              left: 0,
              right: 0,
              child: const BottomHomeWidget()),
          const Positioned(child: BottomSheetIcon()),
          const SearchForLocation(),
        ],
      ),
    );
  }
}
