import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_state.freezed.dart';

@freezed
class BookingState with _$BookingState {
  const factory BookingState.initial() = _Initial;
  const factory BookingState.loading() = _Loading;
  const factory BookingState.serviceDetailsEntered({required String details}) = _ServiceDetailsEntered;
  const factory BookingState.scheduleConfirmed({required String details, required DateTime scheduledDate}) = _ScheduleConfirmed;
  const factory BookingState.success({required String bookingId}) = _Success;
  const factory BookingState.failure({required String message}) = _Failure;
  const factory BookingState.updating({required String currentStatus}) = _Updating;
}
