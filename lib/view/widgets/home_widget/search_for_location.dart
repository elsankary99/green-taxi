import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';
import 'package:green_taxi/core/widget/custom_circle_indicator.dart';
import 'package:green_taxi/data/model/auto_complete_model/auto_complete_model.dart';
import 'package:green_taxi/provider/auto_complete_provider/auto_complete_provider.dart';
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
      border: const BorderSide(color: AppColors.grey, width: 2),
      borderRadius: BorderRadius.circular(11.r),
      margins: EdgeInsets.only(top: 115.h, left: 16.w, right: 16.w),
      controller: provider.controller,
      hint: AppStrings.searchForDestination,
      hintStyle: AppTextStyle.poppinsRegular14,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      iconColor: AppColors.green,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        ref.read(inputProvider.notifier).state = query;
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(
              Icons.place,
            ),
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
            child: Column(
              children: [
                ref.watch(autoCompleteProvider).when(
                      data: (data) => ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const ClampingScrollPhysics(),
                        itemCount: data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SearchedPlaceWidget(data: data[index]);
                        },
                      ),
                      error: (error, _) => Center(
                          child: Text(
                        error.toString(),
                        style: AppTextStyle.poppinsBold12
                            .copyWith(color: Colors.red),
                      )),
                      loading: () => const CustomCircleIndicator(
                        color: AppColors.green,
                      ),
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SearchedPlaceWidget extends ConsumerWidget {
  const SearchedPlaceWidget({
    super.key,
    required this.data,
  });
  final AutoCompleteModel data;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(mapProvider.notifier);
    return ListTile(
      onTap: () async {
        provider.controller.close();
        provider.markers.clear();
        await provider.getPlaceDetails(
            placeName: data.description!, placeId: data.placeId!);
      },
      title: Text(
        data.description!,
        style: AppTextStyle.poppinsBold14,
      ),
      shape: const Border(bottom: BorderSide(color: AppColors.grey, width: 2)),
    );
  }
}
