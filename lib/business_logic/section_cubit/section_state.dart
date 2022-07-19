part of 'section_cubit.dart';

@immutable
abstract class SectionState {}

class SectionInitial extends SectionState {}

class GetSectionLoadingState extends SectionState {}

class GetSectionSuccessState extends SectionState {}

class GetSectionErrorState extends SectionState {
  final String error;

  GetSectionErrorState(this.error);
}

class AddSectionLoadingState extends SectionState {}

class AddSectionSuccessState extends SectionState {}

class AddSectionErrorState extends SectionState {
  final String error;

  AddSectionErrorState(this.error);
}

class UpdateSectionLoadingState extends SectionState {}

class UpdateSectionSuccessState extends SectionState {}

class UpdateSectionErrorState extends SectionState {
  final String error;

  UpdateSectionErrorState(this.error);
}

class DeleteSectionLoadingState extends SectionState {}

class DeleteSectionSuccessState extends SectionState {}

class DeleteSectionErrorState extends SectionState {
  final String error;

  DeleteSectionErrorState(this.error);
}
