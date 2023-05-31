part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class InitialNewsEvent extends NewsEvent {
  final String id;
  const InitialNewsEvent({required this.id});

  @override
  List<Object> get props => [id];
}