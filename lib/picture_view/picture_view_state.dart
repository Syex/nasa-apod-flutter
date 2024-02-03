import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nasa_apod/picture_view/picture.dart';

part "picture_view_state.freezed.dart";

sealed class PictureViewState {}

class PictureViewLoadingState extends PictureViewState {}

class PictureViewErrorState extends PictureViewState {}

@freezed
class PictureViewSuccessState extends PictureViewState
    with _$PictureViewSuccessState {
  factory PictureViewSuccessState(
      {required Picture picture,
      required DateTime selectedDate,
      required bool showNextButton}) = _PictureViewSuccessState;
}
