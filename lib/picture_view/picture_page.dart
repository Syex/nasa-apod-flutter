import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod/di.dart';
import 'package:nasa_apod/picture_view/picture_view_cubit.dart';
import 'package:nasa_apod/picture_view/picture_view_state.dart';

class PicturePage extends StatefulWidget {
  const PicturePage({super.key});

  @override
  State<StatefulWidget> createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
  final pictureViewCubit = getIt.get<PictureViewCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => pictureViewCubit..loadPictureOfSelectedDate(),
      child: BlocBuilder<PictureViewCubit, PictureViewState>(
        builder: (BuildContext context, PictureViewState state) {
          return Expanded(child: Builder(
            builder: (BuildContext context) {
              switch (state) {
                case PictureViewLoadingState():
                  return const CircularProgressIndicator();
                case PictureViewErrorState():
                  return const Text("error");
                case PictureViewSuccessState():
                  return const Text("success");
              }
            },
          ));
        },
      ),
    );
  }
}
