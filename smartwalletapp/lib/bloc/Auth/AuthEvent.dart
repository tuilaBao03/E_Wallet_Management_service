// ignore_for_file: file_names

abstract class AuthEvent{}
class AuthenticateEvent extends AuthEvent{
  final String username;
  final String password;
  AuthenticateEvent(this.password,this.username);
}
class RegisterEvent extends AuthEvent{

}