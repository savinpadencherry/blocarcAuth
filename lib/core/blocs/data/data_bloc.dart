// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fhirpat/core/logger.dart';

import 'package:fhirpat/core/repository/storage_repository.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> with LogMixin {
  final StorageRepository storageRepository;
  DataBloc({
    required this.storageRepository,
  }) : super(DataInitial()) {
    on<DataEvent>((event, emit) {});
  }
}
