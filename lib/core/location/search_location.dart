import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flymefy/core/extension/context.dart';
import 'package:flymefy/core/extension/data_type.dart';
import 'package:flymefy/core/extension/widget.dart';
import 'package:flymefy/core/input_validation/input_border.dart';
import 'package:flymefy/core/location/location_card.dart';
import 'package:flymefy/core/widget/empty_content.dart';
import 'package:flymefy/core/widget/error_content.dart';
import 'package:flymefy/core/widget/loading.dart';
import 'package:flymefy/features/general/domain/entity/location.dart';
import 'package:flymefy/features/general/presernatation/logic/search/location/location_search_cubit.dart';

import '../../../core/enum/enums.dart';
import '../../../core/helper/function.dart';
import '../../../core/resources_manager/assets.dart';
import '../../../core/resources_manager/color.dart';
import '../../../core/resources_manager/strings.dart';
import '../../../core/resources_manager/values.dart';

class SearchServiceLocationDelegate extends SearchDelegate<LocationSearch> {
  final LocationSearchCubit bloc;
  SearchServiceLocationDelegate({required this.bloc});

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: ColorManager.whiteColor,
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: ColorManager.blackColor.withOpacity(.45),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        fillColor: const Color(0xFFF6F6F6),
        border: getInputBorder(colorBorder: const Color(0xFFF6F6F6)),
        enabledBorder: getInputBorder(colorBorder: const Color(0xFFF6F6F6)),
        focusedBorder: getInputBorder(colorBorder: const Color(0xFFF6F6F6)),
        disabledBorder: getInputBorder(colorBorder: const Color(0xFFF6F6F6)),
        errorBorder: getInputBorder(colorBorder: const Color(0xFFF6F6F6)),
        focusedErrorBorder:
            getInputBorder(colorBorder: const Color(0xFFF6F6F6)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) => [
        if (query.isNotEmpty && MediaQuery.of(context).viewInsets.bottom != 0)
          IconButton(
            icon: Icon(Icons.clear,
                size: 24, color: ColorManager.blackColor.withOpacity(.45)),
            onPressed: () {
              query = '';
            },
          ),
      ];

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios,
          size: 24, color: ColorManager.primaryColor),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    context.read<LocationSearchCubit>().getLocations(query);

    return BlocBuilder<LocationSearchCubit, LocationSearchState>(
      bloc: bloc,
      builder: (BuildContext context, state) {
        if (state.flowStateApp == FlowStateApp.loading) {
          return const LoadinContent();
        } else if (state.flowStateApp == FlowStateApp.error) {
          return ErrorContent(
              message: state.failure.message,
              onRefresh: () =>
                  context.read<LocationSearchCubit>().getLocations(query));
        }
        return [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            height: 25,
            child: [
              [
                AppStrings.resultFor.toText(context,
                    color: ColorManager.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis),
                AppSize.appSize4.widthSizedBox,
                "'$query'".toText(context,
                    color: ColorManager.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis),
              ].toRow(mainAxisAlignment: MainAxisAlignment.start),
              state.locationSearchData.locationSearch.isNotEmpty
                  ? ("${state.locationSearchData.locationSearch.length} ${trans(context, AppStrings.resultFor)} ")
                      .toText(context,
                          color: ColorManager.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis)
                  : AppSize.appSize0.widthSizedBox,
            ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
          ),
          AppSize.appSize16.heightSizedBox,
          Expanded(
              child: state.locationSearchData.locationSearch.isEmpty
                  ? Center(
                      child: [
                        Assets.assetsImgEmptySearch.toSvgAssetImage(),
                        AppStrings.noResult
                            .toText(
                              context,
                              color: ColorManager.blackColor,
                              fontSize: 12,
                              maxLines: 5,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w400,
                            )
                            .towidthSizedBox(context.width - 100)
                      ].toColumn(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        return LocationCard(
                          locationSearch:
                              state.locationSearchData.locationSearch[index],
                        ).toButton(() {
                          close(context,
                              state.locationSearchData.locationSearch[index]);
                        });
                      },
                      itemCount: state.locationSearchData.locationSearch.length,
                    ))
        ].toColumn(crossAxisAlignment: CrossAxisAlignment.start);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const EmptyContent();
  }
}
