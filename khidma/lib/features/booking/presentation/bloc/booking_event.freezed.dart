// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookingEvent()';
}


}

/// @nodoc
class $BookingEventCopyWith<$Res>  {
$BookingEventCopyWith(BookingEvent _, $Res Function(BookingEvent) __);
}


/// Adds pattern-matching-related methods to [BookingEvent].
extension BookingEventPatterns on BookingEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _ServiceDetailsSubmitted value)?  serviceDetailsSubmitted,TResult Function( _ScheduleSelected value)?  scheduleSelected,TResult Function( _PaymentSubmitted value)?  paymentSubmitted,TResult Function( _StatusUpdated value)?  statusUpdated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _ServiceDetailsSubmitted() when serviceDetailsSubmitted != null:
return serviceDetailsSubmitted(_that);case _ScheduleSelected() when scheduleSelected != null:
return scheduleSelected(_that);case _PaymentSubmitted() when paymentSubmitted != null:
return paymentSubmitted(_that);case _StatusUpdated() when statusUpdated != null:
return statusUpdated(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _ServiceDetailsSubmitted value)  serviceDetailsSubmitted,required TResult Function( _ScheduleSelected value)  scheduleSelected,required TResult Function( _PaymentSubmitted value)  paymentSubmitted,required TResult Function( _StatusUpdated value)  statusUpdated,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _ServiceDetailsSubmitted():
return serviceDetailsSubmitted(_that);case _ScheduleSelected():
return scheduleSelected(_that);case _PaymentSubmitted():
return paymentSubmitted(_that);case _StatusUpdated():
return statusUpdated(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _ServiceDetailsSubmitted value)?  serviceDetailsSubmitted,TResult? Function( _ScheduleSelected value)?  scheduleSelected,TResult? Function( _PaymentSubmitted value)?  paymentSubmitted,TResult? Function( _StatusUpdated value)?  statusUpdated,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _ServiceDetailsSubmitted() when serviceDetailsSubmitted != null:
return serviceDetailsSubmitted(_that);case _ScheduleSelected() when scheduleSelected != null:
return scheduleSelected(_that);case _PaymentSubmitted() when paymentSubmitted != null:
return paymentSubmitted(_that);case _StatusUpdated() when statusUpdated != null:
return statusUpdated(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String serviceId)?  started,TResult Function( String details)?  serviceDetailsSubmitted,TResult Function( DateTime scheduledDate)?  scheduleSelected,TResult Function( String paymentMethodId)?  paymentSubmitted,TResult Function( String status)?  statusUpdated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.serviceId);case _ServiceDetailsSubmitted() when serviceDetailsSubmitted != null:
return serviceDetailsSubmitted(_that.details);case _ScheduleSelected() when scheduleSelected != null:
return scheduleSelected(_that.scheduledDate);case _PaymentSubmitted() when paymentSubmitted != null:
return paymentSubmitted(_that.paymentMethodId);case _StatusUpdated() when statusUpdated != null:
return statusUpdated(_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String serviceId)  started,required TResult Function( String details)  serviceDetailsSubmitted,required TResult Function( DateTime scheduledDate)  scheduleSelected,required TResult Function( String paymentMethodId)  paymentSubmitted,required TResult Function( String status)  statusUpdated,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.serviceId);case _ServiceDetailsSubmitted():
return serviceDetailsSubmitted(_that.details);case _ScheduleSelected():
return scheduleSelected(_that.scheduledDate);case _PaymentSubmitted():
return paymentSubmitted(_that.paymentMethodId);case _StatusUpdated():
return statusUpdated(_that.status);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String serviceId)?  started,TResult? Function( String details)?  serviceDetailsSubmitted,TResult? Function( DateTime scheduledDate)?  scheduleSelected,TResult? Function( String paymentMethodId)?  paymentSubmitted,TResult? Function( String status)?  statusUpdated,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.serviceId);case _ServiceDetailsSubmitted() when serviceDetailsSubmitted != null:
return serviceDetailsSubmitted(_that.details);case _ScheduleSelected() when scheduleSelected != null:
return scheduleSelected(_that.scheduledDate);case _PaymentSubmitted() when paymentSubmitted != null:
return paymentSubmitted(_that.paymentMethodId);case _StatusUpdated() when statusUpdated != null:
return statusUpdated(_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements BookingEvent {
  const _Started({required this.serviceId});


 final  String serviceId;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId));
}


@override
int get hashCode => Object.hash(runtimeType,serviceId);

@override
String toString() {
  return 'BookingEvent.started(serviceId: $serviceId)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $BookingEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 String serviceId
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? serviceId = null,}) {
  return _then(_Started(
serviceId: null == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ServiceDetailsSubmitted implements BookingEvent {
  const _ServiceDetailsSubmitted({required this.details});


 final  String details;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceDetailsSubmittedCopyWith<_ServiceDetailsSubmitted> get copyWith => __$ServiceDetailsSubmittedCopyWithImpl<_ServiceDetailsSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceDetailsSubmitted&&(identical(other.details, details) || other.details == details));
}


@override
int get hashCode => Object.hash(runtimeType,details);

@override
String toString() {
  return 'BookingEvent.serviceDetailsSubmitted(details: $details)';
}


}

/// @nodoc
abstract mixin class _$ServiceDetailsSubmittedCopyWith<$Res> implements $BookingEventCopyWith<$Res> {
  factory _$ServiceDetailsSubmittedCopyWith(_ServiceDetailsSubmitted value, $Res Function(_ServiceDetailsSubmitted) _then) = __$ServiceDetailsSubmittedCopyWithImpl;
@useResult
$Res call({
 String details
});




}
/// @nodoc
class __$ServiceDetailsSubmittedCopyWithImpl<$Res>
    implements _$ServiceDetailsSubmittedCopyWith<$Res> {
  __$ServiceDetailsSubmittedCopyWithImpl(this._self, this._then);

  final _ServiceDetailsSubmitted _self;
  final $Res Function(_ServiceDetailsSubmitted) _then;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? details = null,}) {
  return _then(_ServiceDetailsSubmitted(
details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ScheduleSelected implements BookingEvent {
  const _ScheduleSelected({required this.scheduledDate});


 final  DateTime scheduledDate;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleSelectedCopyWith<_ScheduleSelected> get copyWith => __$ScheduleSelectedCopyWithImpl<_ScheduleSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleSelected&&(identical(other.scheduledDate, scheduledDate) || other.scheduledDate == scheduledDate));
}


@override
int get hashCode => Object.hash(runtimeType,scheduledDate);

@override
String toString() {
  return 'BookingEvent.scheduleSelected(scheduledDate: $scheduledDate)';
}


}

/// @nodoc
abstract mixin class _$ScheduleSelectedCopyWith<$Res> implements $BookingEventCopyWith<$Res> {
  factory _$ScheduleSelectedCopyWith(_ScheduleSelected value, $Res Function(_ScheduleSelected) _then) = __$ScheduleSelectedCopyWithImpl;
@useResult
$Res call({
 DateTime scheduledDate
});




}
/// @nodoc
class __$ScheduleSelectedCopyWithImpl<$Res>
    implements _$ScheduleSelectedCopyWith<$Res> {
  __$ScheduleSelectedCopyWithImpl(this._self, this._then);

  final _ScheduleSelected _self;
  final $Res Function(_ScheduleSelected) _then;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? scheduledDate = null,}) {
  return _then(_ScheduleSelected(
scheduledDate: null == scheduledDate ? _self.scheduledDate : scheduledDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class _PaymentSubmitted implements BookingEvent {
  const _PaymentSubmitted({required this.paymentMethodId});


 final  String paymentMethodId;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentSubmittedCopyWith<_PaymentSubmitted> get copyWith => __$PaymentSubmittedCopyWithImpl<_PaymentSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentSubmitted&&(identical(other.paymentMethodId, paymentMethodId) || other.paymentMethodId == paymentMethodId));
}


@override
int get hashCode => Object.hash(runtimeType,paymentMethodId);

@override
String toString() {
  return 'BookingEvent.paymentSubmitted(paymentMethodId: $paymentMethodId)';
}


}

/// @nodoc
abstract mixin class _$PaymentSubmittedCopyWith<$Res> implements $BookingEventCopyWith<$Res> {
  factory _$PaymentSubmittedCopyWith(_PaymentSubmitted value, $Res Function(_PaymentSubmitted) _then) = __$PaymentSubmittedCopyWithImpl;
@useResult
$Res call({
 String paymentMethodId
});




}
/// @nodoc
class __$PaymentSubmittedCopyWithImpl<$Res>
    implements _$PaymentSubmittedCopyWith<$Res> {
  __$PaymentSubmittedCopyWithImpl(this._self, this._then);

  final _PaymentSubmitted _self;
  final $Res Function(_PaymentSubmitted) _then;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? paymentMethodId = null,}) {
  return _then(_PaymentSubmitted(
paymentMethodId: null == paymentMethodId ? _self.paymentMethodId : paymentMethodId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _StatusUpdated implements BookingEvent {
  const _StatusUpdated({required this.status});


 final  String status;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatusUpdatedCopyWith<_StatusUpdated> get copyWith => __$StatusUpdatedCopyWithImpl<_StatusUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusUpdated&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'BookingEvent.statusUpdated(status: $status)';
}


}

/// @nodoc
abstract mixin class _$StatusUpdatedCopyWith<$Res> implements $BookingEventCopyWith<$Res> {
  factory _$StatusUpdatedCopyWith(_StatusUpdated value, $Res Function(_StatusUpdated) _then) = __$StatusUpdatedCopyWithImpl;
@useResult
$Res call({
 String status
});




}
/// @nodoc
class __$StatusUpdatedCopyWithImpl<$Res>
    implements _$StatusUpdatedCopyWith<$Res> {
  __$StatusUpdatedCopyWithImpl(this._self, this._then);

  final _StatusUpdated _self;
  final $Res Function(_StatusUpdated) _then;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(_StatusUpdated(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
