part of 'admin_task_cubit.dart';

@immutable
abstract class TaskAdminUserState {}

class TaskInitial extends TaskAdminUserState {}

///////////////////////////////////////////////////////
class AddTaskLoadingState extends TaskAdminUserState {}

class AddTaskSuccessState extends TaskAdminUserState {}

class AddTaskErrorState extends TaskAdminUserState {
  final String error;

  AddTaskErrorState(this.error);
}
