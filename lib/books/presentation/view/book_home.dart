import 'package:anime_app_flutter/books/domain/models/book_model.dart';
import 'package:anime_app_flutter/books/presentation/bloc/book_bloc.dart';
import 'package:anime_app_flutter/books/presentation/bloc/book_event.dart';
import 'package:anime_app_flutter/books/presentation/bloc/book_state.dart';
import 'package:anime_app_flutter/common/domain/services/service_locator.dart';
import 'package:anime_app_flutter/common/domain/utils/enums.dart';
import 'package:anime_app_flutter/common/presentation/component/main_loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BookHome extends StatelessWidget {
  const BookHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BookBloc>()..add(GetBookEvent()),
      child: Scaffold(
        body: BlocBuilder<BookBloc, BookState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const MainLoadingShimmer();
              case RequestStatus.loaded:
                return SafeArea(child: staggeredGrid(context, state.booksModel));
              case RequestStatus.error:
                return const Center(child: Text("Something Went Wrong"));
            }
          },
        ),
      ),
    );
  }
}

Widget staggeredGrid(BuildContext context, List<BooksModel>? booksModel) {
  return StaggeredGridView.countBuilder(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    crossAxisCount: 2, // Number of columns
    itemCount: booksModel?.length, // Adjust the number of items as needed
    itemBuilder: (BuildContext context, int index) {
      return Container(
          decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.network(
                booksModel![index].pictureUrl.toString(), // Replace with your image URL
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Item $index'),
            ),
          ],
        ),
      );
    },
    staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
    mainAxisSpacing: 12.0, // Spacing between rows
    crossAxisSpacing: 12.0, // Spacing between columns
  );
}
