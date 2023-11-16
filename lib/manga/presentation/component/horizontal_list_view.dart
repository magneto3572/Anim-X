import 'package:anime_app_flutter/manga/domain/models/manga_airing_model.dart';
import 'package:flutter/material.dart';

class HorizontalListView extends StatefulWidget {
  final List<Results>? resultList;

  const HorizontalListView({super.key, required this.resultList});

  @override
  _HorizontalListViewState createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.resultList?.length,
      itemBuilder: (context, index) {
      return Container(
              width: 120,
              margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
                child: Image.network(
                  widget.resultList![index].image.toString(),
                  fit: BoxFit.fill,
                ),
              ),
            );
    });
  }
}
