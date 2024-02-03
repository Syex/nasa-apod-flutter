// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picture_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PictureViewSuccessState {
  Picture get picture => throw _privateConstructorUsedError;
  DateTime get selectedDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PictureViewSuccessStateCopyWith<PictureViewSuccessState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PictureViewSuccessStateCopyWith<$Res> {
  factory $PictureViewSuccessStateCopyWith(PictureViewSuccessState value,
          $Res Function(PictureViewSuccessState) then) =
      _$PictureViewSuccessStateCopyWithImpl<$Res, PictureViewSuccessState>;
  @useResult
  $Res call({Picture picture, DateTime selectedDate});

  $PictureCopyWith<$Res> get picture;
}

/// @nodoc
class _$PictureViewSuccessStateCopyWithImpl<$Res,
        $Val extends PictureViewSuccessState>
    implements $PictureViewSuccessStateCopyWith<$Res> {
  _$PictureViewSuccessStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? picture = null,
    Object? selectedDate = null,
  }) {
    return _then(_value.copyWith(
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as Picture,
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PictureCopyWith<$Res> get picture {
    return $PictureCopyWith<$Res>(_value.picture, (value) {
      return _then(_value.copyWith(picture: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PictureViewSuccessStateImplCopyWith<$Res>
    implements $PictureViewSuccessStateCopyWith<$Res> {
  factory _$$PictureViewSuccessStateImplCopyWith(
          _$PictureViewSuccessStateImpl value,
          $Res Function(_$PictureViewSuccessStateImpl) then) =
      __$$PictureViewSuccessStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Picture picture, DateTime selectedDate});

  @override
  $PictureCopyWith<$Res> get picture;
}

/// @nodoc
class __$$PictureViewSuccessStateImplCopyWithImpl<$Res>
    extends _$PictureViewSuccessStateCopyWithImpl<$Res,
        _$PictureViewSuccessStateImpl>
    implements _$$PictureViewSuccessStateImplCopyWith<$Res> {
  __$$PictureViewSuccessStateImplCopyWithImpl(
      _$PictureViewSuccessStateImpl _value,
      $Res Function(_$PictureViewSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? picture = null,
    Object? selectedDate = null,
  }) {
    return _then(_$PictureViewSuccessStateImpl(
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as Picture,
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$PictureViewSuccessStateImpl implements _PictureViewSuccessState {
  _$PictureViewSuccessStateImpl(
      {required this.picture, required this.selectedDate});

  @override
  final Picture picture;
  @override
  final DateTime selectedDate;

  @override
  String toString() {
    return 'PictureViewSuccessState(picture: $picture, selectedDate: $selectedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PictureViewSuccessStateImpl &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, picture, selectedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PictureViewSuccessStateImplCopyWith<_$PictureViewSuccessStateImpl>
      get copyWith => __$$PictureViewSuccessStateImplCopyWithImpl<
          _$PictureViewSuccessStateImpl>(this, _$identity);
}

abstract class _PictureViewSuccessState implements PictureViewSuccessState {
  factory _PictureViewSuccessState(
      {required final Picture picture,
      required final DateTime selectedDate}) = _$PictureViewSuccessStateImpl;

  @override
  Picture get picture;
  @override
  DateTime get selectedDate;
  @override
  @JsonKey(ignore: true)
  _$$PictureViewSuccessStateImplCopyWith<_$PictureViewSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
