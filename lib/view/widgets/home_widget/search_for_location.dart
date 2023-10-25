import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/provider/map_provider/map_provider.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class SearchForLocation extends ConsumerWidget {
  const SearchForLocation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(mapProvider.notifier);
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      margins: EdgeInsets.only(top: 40.h, left: 16.w, right: 16.w),
      controller: provider.controller,
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,

      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {},
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Container(
              height: 5,
              width: context.width,
              color: Colors.red,
            ),
            // Column(
            //   children: [
            //     ListView.builder(
            //       padding: EdgeInsets.zero,
            //       physics: const ClampingScrollPhysics(),
            //       itemCount: 10,
            //       shrinkWrap: true,
            //       itemBuilder: (context, index) {
            //         return Container(
            //           width: context.width,
            //           color: Colors.red,
            //         );
            //       },
            //     ),
            //   ],
            // ),
          ),
        );
      },
    );
  }
}
// SearchBarWidget(
//         title: AppStrings.searchForDestination,
//         onTap: () async {},
//       ),