// ignore_for_file: avoid_print, non_constant_identifier_names, file_names, unused_local_variable

import 'package:smartwalletapp/bloc/Auth/AuthEvent.dart';
import 'package:smartwalletapp/bloc/Auth/AuthState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/repository/UserRepository.dart';
import '../../models/user.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc():super(AuthInitial()){
    on<AuthenticateEvent>(_Authenticate);
  }
  Future<User?> _Authenticate(AuthenticateEvent event,Emitter<AuthState> emit) async{
    try{
      UserRepository userRepository = UserRepository();
      bool check = await userRepository.Authenticate(event.username, event.password);
      print(check);
      if(check){
        User? user = await userRepository.findUserByUserName(event.username);
        emit(AuthSuccess(user!));
      }
      else{
        emit(AuthError("Wrong password or username"));
      }
    }
    catch(e){
      print("_Authenticate: $e");
      return null;
    }
    return null;
  }
  // ignore: unused_element
  // Future<void> _Register(RegisterEvent event,Emitter<AuthState> emit) async{
  //   try{
  //     UserRepository userRepository = UserRepository();
  //       if(event.password == event.repass){
  //         User user = User(
  //             username: event.username,
  //             password: event.password,
  //             phoneNumber: event.phoneNumber,
  //             homeAddress: event.homeAddress,
  //             companyAddress: event.companyAddress,
  //             lastName: event.lastname,
  //             firstName: event.firstname,
  //             avatar: "", email: '',
  //         );
  //         String mess = await userRepository.Register_MPA(user);
  //         if(mess == "200"){
  //           emit(RegisterSuccess(true));
  //         }
  //         else{
  //           emit(AuthError("Register fail"));
  //         }
  //
  //       }
  //       else{
  //         emit(AuthError("Password non match"));
  //       }
  //   }
  //   catch(e){
  //     print("_Resister $e");
  //   }
  // }
}