import 'package:cached_network_image/cached_network_image.dart';
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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BlocProvider(
        create: (_) => pictureViewCubit..loadPictureOfSelectedDate(),
        child: BlocBuilder<PictureViewCubit, PictureViewState>(
          builder: (BuildContext context, PictureViewState state) {
            return SizedBox.expand(
              child: Builder(
                builder: (BuildContext context) {
                  switch (state) {
                    case PictureViewLoadingState():
                      return const Center(child: CircularProgressIndicator());
                    case PictureViewErrorState():
                      return const Text("error");
                    case PictureViewSuccessState():
                      return _buildSuccessUi(state);
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSuccessUi(PictureViewSuccessState state) {
    return CachedNetworkImage(
      imageUrl: state.picture.imageUrl(),
      progressIndicatorBuilder: (context, url, downloadProgress) {
        final percentLoaded = downloadProgress.progress != null
            ? (downloadProgress.progress! * 100).round()
            : null;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("The picture is being loaded..."),
            if (percentLoaded != null) Text("$percentLoaded%")
          ],
        );
      },
    );
  }
}
