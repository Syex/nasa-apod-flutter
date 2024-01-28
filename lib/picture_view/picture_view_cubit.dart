import 'package:api/apod_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:nasa_apod/picture_view/picture.dart';
import 'package:nasa_apod/picture_view/picture_view_state.dart';

@injectable
class PictureViewCubit extends Cubit<PictureViewState> {
  final ApodApi _apodApi;

  PictureViewCubit(this._apodApi) : super(PictureViewLoadingState());

  void loadPictureOfSelectedDate([DateTime? selectedDate]) async {
    final dateToLoad = selectedDate ?? DateTime.now();

    try {
      final pictureEntity = await _apodApi.getPictureOfToday();
      final picture = pictureEntity.toPicture();
      emit(PictureViewSuccessState(picture: picture, selectedDate: dateToLoad));
    } catch (e) {
      emit(PictureViewErrorState());
    }
  }
}
