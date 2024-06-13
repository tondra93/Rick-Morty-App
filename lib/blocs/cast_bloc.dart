import 'package:flutter_bloc/flutter_bloc.dart';
import 'cast_event.dart';
import 'cast_state.dart';
import '../../repositories/character_repository.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  final CharacterRepository repository;

  CastBloc(this.repository) : super(CastInitial()) {
    on<FetchCharacters>((event, emit) async {
      emit(CastLoading());

      try {
        final characters = await repository.fetchCharacters(event.page);
        emit(CastLoaded(characters));
      } catch (e) {
        emit(CastError(e.toString()));
      }
    });
  }
}
