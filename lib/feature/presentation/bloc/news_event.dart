part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class InitialNewsEvent extends NewsEvent {
  const InitialNewsEvent();

  @override
  List<Object> get props => [];
}