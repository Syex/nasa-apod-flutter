import 'package:equatable/equatable.dart';
import 'package:nasa_apod/picture_view/picture.dart';

sealed class PictureViewState {}

class PictureViewLoadingState extends PictureViewState {}

class PictureViewErrorState extends PictureViewState {}

class PictureViewSuccessState extends PictureViewState with EquatableMixin {
  final Picture picture;
  final DateTime selectedDate;

  PictureViewSuccessState({required this.picture, required this.selectedDate});

  @override
  List<Object?> get props => [picture, selectedDate];
}
