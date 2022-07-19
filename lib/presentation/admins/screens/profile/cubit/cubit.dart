import 'package:develocity/presentation/admins/screens/profile/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);
  bool profileEditing = false;

  void profileEdit() {
    profileEditing = !profileEditing;
    emit(ProfileEditingState());
  }
}
