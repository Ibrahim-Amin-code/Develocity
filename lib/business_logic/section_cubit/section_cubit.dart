// ignore_for_file: await_only_futures, avoid_print

import 'package:develocity/constants/network/cache_helper.dart';
import 'package:develocity/model/admins/get_section/get_section_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../constants/network/dio_helper.dart';
import '../../constants/network/network_services.dart';

part 'section_state.dart';

class SectionCubit extends Cubit<SectionState> {
  SectionCubit() : super(SectionInitial());

  static SectionCubit get(context) => BlocProvider.of(context);

  GetSectionModel sectionModel = GetSectionModel();

  void getSections() async {
    emit(GetSectionLoadingState());
    String token = await prefs.getString('token').toString();
    DioHelper.getData(
      url: GetSections,
      token: 'Bearer $token',
    ).then((value) {
      sectionModel = GetSectionModel.fromJson(value.data);
      print(value.data);
      print('tokennnnnnnnnnnnnnnn' + token.toString());
      emit(GetSectionSuccessState());
    }).catchError((error) {
      emit(GetSectionErrorState(error.toString()));
      print(error.toString());
    });
  }
}
