import 'package:anime_app_flutter/common/domain/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MainLoadingShimmer extends StatelessWidget {
  const MainLoadingShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[800]!,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 590,
              color: DarkAppColors.secondaryText,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  height: 20,
                  width: 120,
                  decoration: BoxDecoration(
                    color: DarkAppColors.secondaryText,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  height: 20,
                  width: 120,
                  decoration: BoxDecoration(
                    color: DarkAppColors.secondaryText,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  height: 150,
                  width: 126,
                  decoration: BoxDecoration(
                    color: DarkAppColors.secondaryText,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  height: 150,
                  width: 126,
                  decoration: BoxDecoration(
                    color: DarkAppColors.secondaryText,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  height: 150,
                  width: 126,
                  decoration: BoxDecoration(
                    color: DarkAppColors.secondaryText,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  height: 20,
                  width: 120,
                  decoration: BoxDecoration(
                    color: DarkAppColors.secondaryText,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  height: 20,
                  width: 120,
                  decoration: BoxDecoration(
                    color: DarkAppColors.secondaryText,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  height: 150,
                  width: 126,
                  decoration: BoxDecoration(
                    color: DarkAppColors.secondaryText,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  height: 150,
                  width: 126,
                  decoration: BoxDecoration(
                    color: DarkAppColors.secondaryText,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  height: 150,
                  width: 126,
                  decoration: BoxDecoration(
                    color: DarkAppColors.secondaryText,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
