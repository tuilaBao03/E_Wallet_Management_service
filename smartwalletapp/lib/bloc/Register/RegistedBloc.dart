// ignore_for_file: avoid_print, non_constant_identifier_names, file_names, unused_local_variable



import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart';
import '../../repository/UserRepository.dart';
import 'RegistedEvent.dart';
import 'RegistedState.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterState>{
  RegisterBloc():super(RegisterInitial()){
    on<RegisteredEvent>(_Register);
  }
  // ignore: unused_element
  Future<void> _Register(RegisteredEvent event,Emitter<RegisterState> emit) async{
    try{
      UserRepository userRepository = UserRepository();
        if(event.password == event.repass){
          User user = User(
              username: event.username,
              password: event.password,
              phoneNumber: event.phoneNumber,
              homeAddress: event.homeAddress,
              companyAddress: event.companyAddress,
              lastName: event.lastname,
              firstName: event.firstname,
              avatar: "", email: '', userId: '',
              createdDate: DateTime.now(),
              updateDate: DateTime.now(),
              status: true,
          );
          String mess = await userRepository.Register_MPA(user);
          if(mess == "200"){
            emit(RegisterSuccess(true));
          }
          else{
            emit(RegisterError("Register fail"));
          }

        }
        else{
          emit(RegisterError("Password non match"));
        }
    }
    catch(e){
      print("_Resister $e");
    }
  }
}