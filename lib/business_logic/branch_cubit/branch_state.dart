part of 'branch_cubit.dart';

@immutable
abstract class BranchState {}

class BranchInitial extends BranchState {}

class GetBranchLoadingState extends BranchState {}

class GetBranchSuccessState extends BranchState {}

class GetBranchErrorState extends BranchState {
  final String error;

  GetBranchErrorState(this.error);
}

class AddBranchLoadingState extends BranchState {}

class AddBranchSuccessState extends BranchState {}

class AddBranchErrorState extends BranchState {
  final String error;

  AddBranchErrorState(this.error);
}

class UpdateBranchLoadingState extends BranchState {}

class UpdateBranchSuccessState extends BranchState {}

class UpdateBranchErrorState extends BranchState {
  final String error;

  UpdateBranchErrorState(this.error);
}

class DeleteBranchLoadingState extends BranchState {}

class DeleteBranchSuccessState extends BranchState {}

class DeleteBranchErrorState extends BranchState {
  final String error;

  DeleteBranchErrorState(this.error);
}
