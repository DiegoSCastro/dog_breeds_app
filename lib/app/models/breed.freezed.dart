// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'breed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Breed _$BreedFromJson(Map<String, dynamic> json) {
  return _Breed.fromJson(json);
}

/// @nodoc
mixin _$Breed {
  String get name => throw _privateConstructorUsedError;
  List<String> get subBreed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BreedCopyWith<Breed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreedCopyWith<$Res> {
  factory $BreedCopyWith(Breed value, $Res Function(Breed) then) =
      _$BreedCopyWithImpl<$Res, Breed>;
  @useResult
  $Res call({String name, List<String> subBreed});
}

/// @nodoc
class _$BreedCopyWithImpl<$Res, $Val extends Breed>
    implements $BreedCopyWith<$Res> {
  _$BreedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? subBreed = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      subBreed: null == subBreed
          ? _value.subBreed
          : subBreed // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BreedCopyWith<$Res> implements $BreedCopyWith<$Res> {
  factory _$$_BreedCopyWith(_$_Breed value, $Res Function(_$_Breed) then) =
      __$$_BreedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<String> subBreed});
}

/// @nodoc
class __$$_BreedCopyWithImpl<$Res> extends _$BreedCopyWithImpl<$Res, _$_Breed>
    implements _$$_BreedCopyWith<$Res> {
  __$$_BreedCopyWithImpl(_$_Breed _value, $Res Function(_$_Breed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? subBreed = null,
  }) {
    return _then(_$_Breed(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      subBreed: null == subBreed
          ? _value._subBreed
          : subBreed // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Breed extends _Breed {
  const _$_Breed({this.name = '', final List<String> subBreed = const []})
      : _subBreed = subBreed,
        super._();

  factory _$_Breed.fromJson(Map<String, dynamic> json) =>
      _$$_BreedFromJson(json);

  @override
  @JsonKey()
  final String name;
  final List<String> _subBreed;
  @override
  @JsonKey()
  List<String> get subBreed {
    if (_subBreed is EqualUnmodifiableListView) return _subBreed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subBreed);
  }

  @override
  String toString() {
    return 'Breed(name: $name, subBreed: $subBreed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Breed &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._subBreed, _subBreed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_subBreed));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BreedCopyWith<_$_Breed> get copyWith =>
      __$$_BreedCopyWithImpl<_$_Breed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BreedToJson(
      this,
    );
  }
}

abstract class _Breed extends Breed {
  const factory _Breed({final String name, final List<String> subBreed}) =
      _$_Breed;
  const _Breed._() : super._();

  factory _Breed.fromJson(Map<String, dynamic> json) = _$_Breed.fromJson;

  @override
  String get name;
  @override
  List<String> get subBreed;
  @override
  @JsonKey(ignore: true)
  _$$_BreedCopyWith<_$_Breed> get copyWith =>
      throw _privateConstructorUsedError;
}
