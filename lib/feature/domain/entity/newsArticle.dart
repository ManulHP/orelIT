import 'package:equatable/equatable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'dataEntity.dart';

part 'newsArticle.g.dart';

@CopyWith()
class NewEntity extends Equatable {
  String? category;
  List<DataEntity>? data;
  bool? success;

  NewEntity({this.category, this.data, this.success});

  @override
  // TODO: implement props
  List<Object?> get props => [
        category,
        data,
        success,

  ];

}