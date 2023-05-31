import 'dart:convert';
import '../../domain/entity/dataEntity.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/newsArticle.dart';

NewsModel newsModelFromJson(String str) =>
    NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) =>
    json.encode(data.toJson());

class NewsModel extends Equatable {
  String? category;
  List<DataModel>? data;
  bool? success;

  NewsModel({this.category, this.data, this.success});

  NewsModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    if (json['data'] != null) {
      data = <DataModel>[];
      json['data'].forEach((v) {
        data!.add(new DataModel.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        category,
        data,
        success,
  ];

  NewEntity toEntity() {
    return NewEntity(
      category: category,
      success: success,
      data: List<DataEntity>.from(
          (data ?? <DataModel>[]).map((e) => DataEntity(
            author: e.author ?? "",
            content: e.content ?? "",
            date: e.date ?? "",
            id: e.id ?? "",
            imageUrl: e.imageUrl ?? "",
            readMoreUrl: e.readMoreUrl ?? "",
            time: e.time ?? "",
            title: e.title ?? "",
            url: e.url ?? "",
          ))
      ),
    );
  }

}

class DataModel extends Equatable {
  String? author;
  String? content;
  String? date;
  String? id;
  String? imageUrl;
  String? readMoreUrl;
  String? time;
  String? title;
  String? url;

  DataModel(
      {this.author,
        this.content,
        this.date,
        this.id,
        this.imageUrl,
        this.readMoreUrl,
        this.time,
        this.title,
        this.url});

  DataModel.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    content = json['content'];
    date = json['date'];
    id = json['id'];
    imageUrl = json['imageUrl'];
    readMoreUrl = json['readMoreUrl'];
    time = json['time'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['content'] = this.content;
    data['date'] = this.date;
    data['id'] = this.id;
    data['imageUrl'] = this.imageUrl;
    data['readMoreUrl'] = this.readMoreUrl;
    data['time'] = this.time;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        author,
        content,
        date,
        id,
        imageUrl,
        readMoreUrl,
        time,
        title,
        url
  ];
}