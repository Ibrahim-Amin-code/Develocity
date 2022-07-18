part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class UserOrAdminState extends AppState {}

class ChangeRadioState extends AppState {}

class ChangeColorState extends AppState {}

class ChangeRecentlyAdminsState extends AppState {}

class IndividualOrTeamTask extends AppState {}

class ChangeThemeState extends AppState {}
