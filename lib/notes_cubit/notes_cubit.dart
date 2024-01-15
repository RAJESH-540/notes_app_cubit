import 'dart:js_util';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../data_base/db_helper.dart';
import '../data_base/models.dart';
part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  DbHelper dbHelper;

  NotesCubit(this.dbHelper) : super(NotesInitial());
  List<NotesModel> noteList = [];

  void addNotes(NotesModel notesModel) async {
    emit(NotesLoading());
    var data = await dbHelper.insertData(notesModel);
    if (data) {
      noteList = await dbHelper.getData();
      emit(NotesLoaded(list: noteList));
    } else {
      emit(NotesErrorState(errorMsg: "No data Found"));
    }
  }

  void fetchInitialData() async {
    noteList = await dbHelper.getData();
    emit(NotesLoaded(list: noteList));
  }

  Future<List<NotesModel>> getAllData() async {
    fetchInitialData();
    emit(NotesLoaded(list: noteList));
     return noteList;


  }
   void update( NotesModel notesModel)async{
     var data = await dbHelper.updateNotes(notesModel);
     if(data==1){
       noteList=await dbHelper.getData();
       emit(NotesLoaded(list: noteList));
     }
   }
    void deleteNote(int id)async{
     var data = await dbHelper.deleteNotes(id);
     if(data){
       noteList= await dbHelper.getData();
       emit(NotesLoaded(list: noteList));
     }

    }
}
