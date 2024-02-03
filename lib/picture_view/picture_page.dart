import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod/di.dart';
import 'package:nasa_apod/picture_view/picture.dart';
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
          return SizedBox.expand(
            child: Builder(
              builder: (BuildContext context) {
                switch (state) {
                  case PictureViewLoadingState():
                    return const Center(child: CircularProgressIndicator());
                  case PictureViewErrorState():
                    return const Text("error");
                  case PictureViewSuccessState():
                    return _buildSuccessUi(
                        state: state,
                        context: context,
                        onPreviousCallback: () =>
                            pictureViewCubit.onPreviousDayRequested(),
                        onNextCallback: () =>
                            pictureViewCubit.onNextDayRequested());
                }
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildSuccessUi({
    required PictureViewSuccessState state,
    required BuildContext context,
    required VoidCallback onPreviousCallback,
    required VoidCallback onNextCallback,
  }) {
    final picture = state.picture;
    final copyrightText = picture.copyrightText();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton.outlined(
                    onPressed: onPreviousCallback,
                    icon: const Icon(Icons.arrow_left_outlined)),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    picture.dateForUi(),
                  )),
              if (state.showNextButton)
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton.outlined(
                      onPressed: onNextCallback,
                      icon: const Icon(Icons.arrow_right_outlined)),
                ),
            ],
          ),
        ),
        _pictureDetails(
            picture: picture, context: context, copyrightText: copyrightText),
      ],
    );
  }

  Widget _pictureDetails(
      {required Picture picture,
      required BuildContext context,
      required String? copyrightText}) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          children: [
            Text(
              picture.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Padding(padding: EdgeInsets.only(top: 16)),
            CachedNetworkImage(
              imageUrl: picture.imageUrl(),
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
            ),
            if (copyrightText != null) ...[
              const Padding(padding: EdgeInsets.only(top: 8)),
              Text(
                copyrightText,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
            const Padding(padding: EdgeInsets.only(top: 8)),
            Text(
              picture.explanation,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
