import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_laith/cubit/states.dart';
import 'package:shop_app_laith/model/model.dart';
import 'package:shop_app_laith/shaerd/diohelper/diohelper.dart';
import 'package:shop_app_laith/shaerd/endpoint.dart';

class ShopLoginCubit extends Cubit<ShopLoginState> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
  ShopLoginModel? loginModel;

  void userLogin(
      {required String email, required String password}) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(url: LOGIN, //end point
        data: {'email': email, 'password': password})
        .then((value) {
          loginModel=ShopLoginModel.fromJson(value.data);
          print(loginModel!.data!.token);
          print(loginModel!.status);
          print(loginModel!.message);

      emit(ShopLoginSuccessState());
    }).catchError((error){
      print(error.toString());

      emit(ShopLoginErrorState(error.toString()));


    });
  }
  bool isPassword=true;
  IconData suffix=Icons.visibility_outlined;
  void changPassword(){

    isPassword=!isPassword;
    suffix=isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ShopChangePasswordState());


  }

}
