// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dataEntity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DataEntityCWProxy {
  DataEntity author(String? author);

  DataEntity content(String? content);

  DataEntity date(String? date);

  DataEntity id(String? id);

  DataEntity imageUrl(String? imageUrl);

  DataEntity readMoreUrl(String? readMoreUrl);

  DataEntity time(String? time);

  DataEntity title(String? title);

  DataEntity url(String? url);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DataEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DataEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  DataEntity call({
    String? author,
    String? content,
    String? date,
    String? id,
    String? imageUrl,
    String? readMoreUrl,
    String? time,
    String? title,
    String? url,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDataEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDataEntity.copyWith.fieldName(...)`
class _$DataEntityCWProxyImpl implements _$DataEntityCWProxy {
  const _$DataEntityCWProxyImpl(this._value);

  final DataEntity _value;

  @override
  DataEntity author(String? author) => this(author: author);

  @override
  DataEntity content(String? content) => this(content: content);

  @override
  DataEntity date(String? date) => this(date: date);

  @override
  DataEntity id(String? id) => this(id: id);

  @override
  DataEntity imageUrl(String? imageUrl) => this(imageUrl: imageUrl);

  @override
  DataEntity readMoreUrl(String? readMoreUrl) => this(readMoreUrl: readMoreUrl);

  @override
  DataEntity time(String? time) => this(time: time);

  @override
  DataEntity title(String? title) => this(title: title);

  @override
  DataEntity url(String? url) => this(url: url);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DataEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DataEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  DataEntity call({
    Object? author = const $CopyWithPlaceholder(),
    Object? content = const $CopyWithPlaceholder(),
    Object? date = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? imageUrl = const $CopyWithPlaceholder(),
    Object? readMoreUrl = const $CopyWithPlaceholder(),
    Object? time = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
  }) {
    return DataEntity(
      author: author == const $CopyWithPlaceholder()
          ? _value.author
          // ignore: cast_nullable_to_non_nullable
          : author as String?,
      content: content == const $CopyWithPlaceholder()
          ? _value.content
          // ignore: cast_nullable_to_non_nullable
          : content as String?,
      date: date == const $CopyWithPlaceholder()
          ? _value.date
          // ignore: cast_nullable_to_non_nullable
          : date as String?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      imageUrl: imageUrl == const $CopyWithPlaceholder()
          ? _value.imageUrl
          // ignore: cast_nullable_to_non_nullable
          : imageUrl as String?,
      readMoreUrl: readMoreUrl == const $CopyWithPlaceholder()
          ? _value.readMoreUrl
          // ignore: cast_nullable_to_non_nullable
          : readMoreUrl as String?,
      time: time == const $CopyWithPlaceholder()
          ? _value.time
          // ignore: cast_nullable_to_non_nullable
          : time as String?,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      url: url == const $CopyWithPlaceholder()
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String?,
    );
  }
}

extension $DataEntityCopyWith on DataEntity {
  /// Returns a callable class that can be used as follows: `instanceOfDataEntity.copyWith(...)` or like so:`instanceOfDataEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DataEntityCWProxy get copyWith => _$DataEntityCWProxyImpl(this);
}
