part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}
class NotesLoading extends NotesState {}
class NotesLoaded extends NotesState {
 final List<NotesModel> list;
 NotesLoaded({required this.list});
}
 class NotesErrorState extends NotesState{
  final String errorMsg;
  NotesErrorState({required this.errorMsg});
}
