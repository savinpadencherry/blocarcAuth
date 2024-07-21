import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fhir_server_event.dart';
part 'fhir_server_state.dart';

class FhirServerBloc extends Bloc<FhirServerEvent, FhirServerState> {
  FhirServerBloc() : super(FhirServerInitial()) {
    on<FhirServerEvent>((event, emit) {});
  }
}
