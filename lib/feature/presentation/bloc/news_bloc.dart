import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:orel_it/common/usecase/usecase.dart';

import '../../../common/errors/failure.dart';
import '../../domain/entity/newsArticle.dart';
import '../../domain/usecase/get_news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsUseCase getNewsUseCase;

  NewsBloc({required this.getNewsUseCase})
      : super(const NewsState(status: NewsStatus.initial)) {
    on<InitialNewsEvent>(_newEvent);
  }

  Future<FutureOr<void>> _newEvent(InitialNewsEvent event, Emitter<NewsState> emit) async {

    Either<Failure, NewEntity> result = await getNewsUseCase(NoParams());
    debugPrint("#result: $result");

    result.fold((failure) {
      String message = '';
      if (failure is ServerFailure) {
        message = failure.message;
      } else {
        message = "Something went wrong";
      }
      emit(NewsState(status: NewsStatus.failure, errorMessage: message));
    },
            (data) => emit(NewsState(status: NewsStatus.success, newsEntity: data)));
  }

}
