import 'package:equatable/equatable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'dataEntity.g.dart';

@CopyWith()
class DataEntity extends Equatable {
  String? author;
  String? content;
  String? date;
  String? id;
  String? imageUrl;
  String? readMoreUrl;
  String? time;
  String? title;
  String? url;

  DataEntity(
      {this.author,
        this.content,
        this.date,
        this.id,
        this.imageUrl,
        this.readMoreUrl,
        this.time,
        this.title,
        this.url});

  @override
  // TODO: implement props
  List<Object?> get props => [author, content, date, id, imageUrl, readMoreUrl, time, title, url];

}