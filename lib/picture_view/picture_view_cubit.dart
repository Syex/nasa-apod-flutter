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
      final pictureEntity = await _apodApi.getPictureOfDate(dateToLoad);
      final picture = pictureEntity.toPicture();
      emit(PictureViewSuccessState(
          picture: picture,
          selectedDate: dateToLoad,
          showNextButton: _canLoadNextDay(dateToLoad)));
    } catch (e) {
      emit(PictureViewErrorState());
    }
  }

  void onPreviousDayRequested() {
    final currentSelectedDate = state is PictureViewSuccessState
        ? (state as PictureViewSuccessState).selectedDate
        : DateTime.now();
    emit(PictureViewLoadingState());
    final previousDate = currentSelectedDate.subtract(const Duration(days: 1));
    loadPictureOfSelectedDate(previousDate);
  }

  void onNextDayRequested() {
    final currentSelectedDate = state is PictureViewSuccessState
        ? (state as PictureViewSuccessState).selectedDate
        : DateTime.now();
    emit(PictureViewLoadingState());
    final nextDate = currentSelectedDate.add(const Duration(days: 1));
    loadPictureOfSelectedDate(nextDate);
  }

  bool _canLoadNextDay(DateTime selectedDate) {
    final currentDate = DateTime.now();
    final selectedDatePlusOne = selectedDate.add(const Duration(days: 1));
    return selectedDatePlusOne.isBefore(currentDate);
  }
}
