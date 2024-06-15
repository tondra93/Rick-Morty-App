import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/character_repository.dart';
import 'cast_event.dart';
import 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  final CharacterRepository characterRepository;

  CastBloc(this.characterRepository) : super(CastInitial()) {
    on<FetchCharacters>(_onFetchCharacters);
  }

  Future<void> _onFetchCharacters(FetchCharacters event, Emitter<CastState> emit) async {
    emit(CastLoading());
    try {
      final characters = await characterRepository.fetchCharacters(event.page);
      print('Loaded characters: ${characters.length}'); 
      emit(CastLoaded(characters: characters));
    } catch (e) {
      print('Error fetching characters: $e'); 
      emit(CastError(message: e.toString()));
    }
  }
}
