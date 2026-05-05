import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_event.freezed.dart';

@freezed
class BookingEvent with _$BookingEvent {
  const factory BookingEvent.started({required String serviceId}) = _Started;
  const factory BookingEvent.serviceDetailsSubmitted({required String details}) = _ServiceDetailsSubmitted;
  const factory BookingEvent.scheduleSelected({required DateTime scheduledDate}) = _ScheduleSelected;
  const factory BookingEvent.paymentSubmitted({required String paymentMethodId}) = _PaymentSubmitted;
  const factory BookingEvent.statusUpdated({required String status}) = _StatusUpdated;
}
