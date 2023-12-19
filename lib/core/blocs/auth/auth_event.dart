// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  const SignUpEvent({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [email, password];
}

class UploadPictureAndUpdateUserData extends AuthEvent {
  final String username;
  final XFile? file;
  final String userId;
  final String email;
  final String documentId;
  const UploadPictureAndUpdateUserData({
    required this.username,
    this.file,
    required this.userId,
    required this.email,
    required this.documentId,
  });
  @override
  List<Object?> get props => [username, file, userId, email, documentId];
}

class LogInEvent extends AuthEvent {
  final String email;
  final String password;
  const LogInEvent({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [email, password];
}

class PhoneAuthenticationEvent extends AuthEvent {
  final String phoneNumber;
  const PhoneAuthenticationEvent({
    required this.phoneNumber,
  });
  @override
  List<Object> get props => [phoneNumber];
}

class VerifyPhoneCodeEvent extends AuthEvent {
  final String code;
  final String verficationId;
  const VerifyPhoneCodeEvent({
    required this.code,
    required this.verficationId,
  });
  @override
  List<Object> get props => [code, verficationId];
}

class CheckingForVerificationId extends AuthEvent {}

class SignInWithPhoneCredentialsEvent extends AuthEvent {
  final PhoneAuthCredential phoneAuthCredential;
  const SignInWithPhoneCredentialsEvent({
    required this.phoneAuthCredential,
  });
  @override
  List<Object> get props => [phoneAuthCredential];
}

class UpdateUserProfileDetails extends AuthEvent {
  final XFile xfile;
  final String username;
  final String userID;
  const UpdateUserProfileDetails({
    required this.xfile,
    required this.username,
    required this.userID,
  });
  @override
  List<Object> get props => [username, xfile, userID];
}

class FetchUserDetailsFromServer extends AuthEvent {
  final String userId;

  const FetchUserDetailsFromServer({required this.userId});
  @override
  List<Object> get props => [userId];
}

class OnAppStart extends AuthEvent {}

class LogOutEvent extends AuthEvent {}

class ClearHydrateEvent extends AuthEvent {}

class ResetAuthEvent extends AuthEvent {}

class AuthGoogleSignInEvent extends AuthEvent {}

class ForgotPasswordCodeEvent extends AuthEvent {
  final String email;
  const ForgotPasswordCodeEvent({
    required this.email,
  });
  @override
  List<Object> get props => [email];
}

class NewForgotPasswordEvent extends AuthEvent {
  final String email;
  const NewForgotPasswordEvent({
    required this.email,
  });
  @override
  List<Object> get props => [email];
}

class ResetPasswordEvent extends AuthEvent {
  final String password;
  const ResetPasswordEvent({
    required this.password,
  });
  @override
  List<Object> get props => [
        password,
      ];
}
