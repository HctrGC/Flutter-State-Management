import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:singleton/models/usuario.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  UserBloc() : super(UserInitialState()) {

    on<ActivateUser>((event, emit) => emit(ActivatedUserState(event.user)));

    on<ChangeUserAge>((event, emit) {
      if (!state.existUser) return;
      emit(ActivatedUserState(state.user!.copyWith(edad: event.age)));
    });

    on<AddUserProfession>((event, emit) {
      if (!state.existUser) return;
      final professions = state.user!.profesiones;
      professions.addAll(event.professions);
      emit(ActivatedUserState(state.user!.copyWith(profesiones: professions)));
    });

    on<DeleteUser>((event, emit) => emit(UserInitialState()));

  }
  
}