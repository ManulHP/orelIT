// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsEntity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NewEntityCWProxy {
  NewEntity category(String? category);

  NewEntity data(List<DataEntity>? data);

  NewEntity success(bool? success);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NewEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NewEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  NewEntity call({
    String? category,
    List<DataEntity>? data,
    bool? success,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNewEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNewEntity.copyWith.fieldName(...)`
class _$NewEntityCWProxyImpl implements _$NewEntityCWProxy {
  const _$NewEntityCWProxyImpl(this._value);

  final NewEntity _value;

  @override
  NewEntity category(String? category) => this(category: category);

  @override
  NewEntity data(List<DataEntity>? data) => this(data: data);

  @override
  NewEntity success(bool? success) => this(success: success);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NewEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NewEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  NewEntity call({
    Object? category = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? success = const $CopyWithPlaceholder(),
  }) {
    return NewEntity(
      category: category == const $CopyWithPlaceholder()
          ? _value.category
          // ignore: cast_nullable_to_non_nullable
          : category as String?,
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<DataEntity>?,
      success: success == const $CopyWithPlaceholder()
          ? _value.success
          // ignore: cast_nullable_to_non_nullable
          : success as bool?,
    );
  }
}

extension $NewEntityCopyWith on NewEntity {
  /// Returns a callable class that can be used as follows: `instanceOfNewEntity.copyWith(...)` or like so:`instanceOfNewEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NewEntityCWProxy get copyWith => _$NewEntityCWProxyImpl(this);
}
