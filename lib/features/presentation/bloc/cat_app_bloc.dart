// features/presentation/bloc/cat_app_bloc.dart
import 'package:cat_trivia/features/data/models/cat_model.dart';
import 'package:cat_trivia/features/data/models/fact_model.dart';
import 'package:cat_trivia/features/data/services/cat_services.dart';
import 'package:cat_trivia/features/data/services/fact_services.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

abstract class CatState extends Equatable {
  const CatState();

  @override
  List<Object?> get props => [];
}

class CatInitial extends CatState {}

class CatLoading extends CatState {}

class CatLoaded extends CatState {
  final CatImage catImage;
  final CatFact catFact;

  const CatLoaded({required this.catImage, required this.catFact});

  @override
  List<Object?> get props => [catImage, catFact];
}

class CatError extends CatState {
  final String message;

  const CatError({required this.message});

  @override
  List<Object?> get props => [message];
}

abstract class CatEvent extends Equatable {
  const CatEvent();

  @override
  List<Object?> get props => [];
}

class FetchCat extends CatEvent {}

class CatBloc extends Bloc<CatEvent, CatState> {
  final CatService catService;
  final FactServices factService;

  CatBloc({required this.catService, required this.factService})
      : super(CatInitial()) {
    on<FetchCat>((event, emit) async {
      emit(CatLoading());

      try {
        final catImageResponse = await catService.getCatImage();
        final catImage = CatImage.fromJson(catImageResponse.data);

        final catFactResponse = await factService.getFacts();
        final catFact = CatFact.fromJson(catFactResponse.data[0]);

        emit(CatLoaded(catImage: catImage, catFact: catFact));
      } catch (e) {
        emit(CatError(message: e.toString()));
      }
    });
  }
}
