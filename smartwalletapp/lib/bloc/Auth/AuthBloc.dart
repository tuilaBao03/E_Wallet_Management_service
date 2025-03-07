// ignore_for_file: avoid_print, non_constant_identifier_names, file_names, unused_local_variable

import 'package:smartwalletapp/ApiResult.dart';
import 'package:smartwalletapp/bloc/Auth/AuthEvent.dart';
import 'package:smartwalletapp/bloc/Auth/AuthState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/repository/userRepository.dart';
import 'package:smartwalletapp/repository/authRepository.dart';
import '../../models/user.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc():super(AuthInitial()){
    on<AuthenticateEvent>(_Authenticate);
    // on<ForgetPassWordEvent>(_CheckAndChangePass);
  }
  Future<User?> _Authenticate(AuthenticateEvent event,Emitter<AuthState> emit) async{
    try{
      UserRepository userRepository = UserRepository();
      AuthenRepository authenRepository = AuthenRepository();
      AuthResult result = await authenRepository.authenticate(event.password, event.username);
      if(result.code == 0){
        ApiResult results = await userRepository.giveUserByName(event.username, result.accesstoken);
        User user = results.result;
        emit(AuthSuccess(user,result.accesstoken));
      }
      else{
        emit(AuthError(result.code.toString()));
      }
    }
    catch(e){
      print("_Authenticate: $e");
      return null;
    }
    return null;
  }
}