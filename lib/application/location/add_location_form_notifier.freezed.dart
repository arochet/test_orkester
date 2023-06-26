// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_location_form_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddLocationFormData {
  AppLocation get location => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<LocationFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddLocationFormDataCopyWith<AddLocationFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddLocationFormDataCopyWith<$Res> {
  factory $AddLocationFormDataCopyWith(
          AddLocationFormData value, $Res Function(AddLocationFormData) then) =
      _$AddLocationFormDataCopyWithImpl<$Res, AddLocationFormData>;
  @useResult
  $Res call(
      {AppLocation location,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<LocationFailure, Unit>> authFailureOrSuccessOption});

  $AppLocationCopyWith<$Res> get location;
}

/// @nodoc
class _$AddLocationFormDataCopyWithImpl<$Res, $Val extends AddLocationFormData>
    implements $AddLocationFormDataCopyWith<$Res> {
  _$AddLocationFormDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as AppLocation,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<LocationFailure, Unit>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppLocationCopyWith<$Res> get location {
    return $AppLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AddLocationFormDataCopyWith<$Res>
    implements $AddLocationFormDataCopyWith<$Res> {
  factory _$$_AddLocationFormDataCopyWith(_$_AddLocationFormData value,
          $Res Function(_$_AddLocationFormData) then) =
      __$$_AddLocationFormDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AppLocation location,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<LocationFailure, Unit>> authFailureOrSuccessOption});

  @override
  $AppLocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$_AddLocationFormDataCopyWithImpl<$Res>
    extends _$AddLocationFormDataCopyWithImpl<$Res, _$_AddLocationFormData>
    implements _$$_AddLocationFormDataCopyWith<$Res> {
  __$$_AddLocationFormDataCopyWithImpl(_$_AddLocationFormData _value,
      $Res Function(_$_AddLocationFormData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_$_AddLocationFormData(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as AppLocation,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<LocationFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_AddLocationFormData implements _AddLocationFormData {
  const _$_AddLocationFormData(
      {required this.location,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption});

  @override
  final AppLocation location;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<LocationFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'AddLocationFormData(location: $location, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddLocationFormData &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                other.authFailureOrSuccessOption ==
                    authFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, location, showErrorMessages,
      isSubmitting, authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddLocationFormDataCopyWith<_$_AddLocationFormData> get copyWith =>
      __$$_AddLocationFormDataCopyWithImpl<_$_AddLocationFormData>(
          this, _$identity);
}

abstract class _AddLocationFormData implements AddLocationFormData {
  const factory _AddLocationFormData(
      {required final AppLocation location,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<LocationFailure, Unit>>
          authFailureOrSuccessOption}) = _$_AddLocationFormData;

  @override
  AppLocation get location;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<LocationFailure, Unit>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_AddLocationFormDataCopyWith<_$_AddLocationFormData> get copyWith =>
      throw _privateConstructorUsedError;
}
