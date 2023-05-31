part of 'news_bloc.dart';

enum NewsStatus { initial, loading, success, failure }

class NewsState extends Equatable {
  final NewsStatus status;
  final NewEntity? newsEntity;
  final String? errorMessage;

  const NewsState({required this.status, this.errorMessage, this.newsEntity});

  NewsState copyWith({
    NewsStatus? status,
    NewEntity? newsEntity,
    String? errorMessage,
  }) {
    return NewsState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      newsEntity: newsEntity ?? this.newsEntity,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, newsEntity];
}