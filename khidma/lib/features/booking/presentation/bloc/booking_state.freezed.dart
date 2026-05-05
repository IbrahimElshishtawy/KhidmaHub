// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookingState()';
}


}

/// @nodoc
class $BookingStateCopyWith<$Res>  {
$BookingStateCopyWith(BookingState _, $Res Function(BookingState) __);
}


/// Adds pattern-matching-related methods to [BookingState].
extension BookingStatePatterns on BookingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _ServiceDetailsEntered value)?  serviceDetailsEntered,TResult Function( _ScheduleConfirmed value)?  scheduleConfirmed,TResult Function( _Success value)?  success,TResult Function( _Failure value)?  failure,TResult Function( _Updating value)?  updating,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _ServiceDetailsEntered() when serviceDetailsEntered != null:
return serviceDetailsEntered(_that);case _ScheduleConfirmed() when scheduleConfirmed != null:
return scheduleConfirmed(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _Updating() when updating != null:
return updating(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _ServiceDetailsEntered value)  serviceDetailsEntered,required TResult Function( _ScheduleConfirmed value)  scheduleConfirmed,required TResult Function( _Success value)  success,required TResult Function( _Failure value)  failure,required TResult Function( _Updating value)  updating,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _ServiceDetailsEntered():
return serviceDetailsEntered(_that);case _ScheduleConfirmed():
return scheduleConfirmed(_that);case _Success():
return success(_that);case _Failure():
return failure(_that);case _Updating():
return updating(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _ServiceDetailsEntered value)?  serviceDetailsEntered,TResult? Function( _ScheduleConfirmed value)?  scheduleConfirmed,TResult? Function( _Success value)?  success,TResult? Function( _Failure value)?  failure,TResult? Function( _Updating value)?  updating,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _ServiceDetailsEntered() when serviceDetailsEntered != null:
return serviceDetailsEntered(_that);case _ScheduleConfirmed() when scheduleConfirmed != null:
return scheduleConfirmed(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _Updating() when updating != null:
return updating(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String details)?  serviceDetailsEntered,TResult Function( String details,  DateTime scheduledDate)?  scheduleConfirmed,TResult Function( String bookingId)?  success,TResult Function( String message)?  failure,TResult Function( String currentStatus)?  updating,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _ServiceDetailsEntered() when serviceDetailsEntered != null:
return serviceDetailsEntered(_that.details);case _ScheduleConfirmed() when scheduleConfirmed != null:
return scheduleConfirmed(_that.details,_that.scheduledDate);case _Success() when success != null:
return success(_that.bookingId);case _Failure() when failure != null:
return failure(_that.message);case _Updating() when updating != null:
return updating(_that.currentStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String details)  serviceDetailsEntered,required TResult Function( String details,  DateTime scheduledDate)  scheduleConfirmed,required TResult Function( String bookingId)  success,required TResult Function( String message)  failure,required TResult Function( String currentStatus)  updating,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _ServiceDetailsEntered():
return serviceDetailsEntered(_that.details);case _ScheduleConfirmed():
return scheduleConfirmed(_that.details,_that.scheduledDate);case _Success():
return success(_that.bookingId);case _Failure():
return failure(_that.message);case _Updating():
return updating(_that.currentStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String details)?  serviceDetailsEntered,TResult? Function( String details,  DateTime scheduledDate)?  scheduleConfirmed,TResult? Function( String bookingId)?  success,TResult? Function( String message)?  failure,TResult? Function( String currentStatus)?  updating,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _ServiceDetailsEntered() when serviceDetailsEntered != null:
return serviceDetailsEntered(_that.details);case _ScheduleConfirmed() when scheduleConfirmed != null:
return scheduleConfirmed(_that.details,_that.scheduledDate);case _Success() when success != null:
return success(_that.bookingId);case _Failure() when failure != null:
return failure(_that.message);case _Updating() when updating != null:
return updating(_that.currentStatus);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements BookingState {
  const _Initial();







@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookingState.initial()';
}


}




/// @nodoc


class _Loading implements BookingState {
  const _Loading();







@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookingState.loading()';
}


}




/// @nodoc


class _ServiceDetailsEntered implements BookingState {
  const _ServiceDetailsEntered({required this.details});


 final  String details;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceDetailsEnteredCopyWith<_ServiceDetailsEntered> get copyWith => __$ServiceDetailsEnteredCopyWithImpl<_ServiceDetailsEntered>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceDetailsEntered&&(identical(other.details, details) || other.details == details));
}


@override
int get hashCode => Object.hash(runtimeType,details);

@override
String toString() {
  return 'BookingState.serviceDetailsEntered(details: $details)';
}


}

/// @nodoc
abstract mixin class _$ServiceDetailsEnteredCopyWith<$Res> implements $BookingStateCopyWith<$Res> {
  factory _$ServiceDetailsEnteredCopyWith(_ServiceDetailsEntered value, $Res Function(_ServiceDetailsEntered) _then) = __$ServiceDetailsEnteredCopyWithImpl;
@useResult
$Res call({
 String details
});




}
/// @nodoc
class __$ServiceDetailsEnteredCopyWithImpl<$Res>
    implements _$ServiceDetailsEnteredCopyWith<$Res> {
  __$ServiceDetailsEnteredCopyWithImpl(this._self, this._then);

  final _ServiceDetailsEntered _self;
  final $Res Function(_ServiceDetailsEntered) _then;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? details = null,}) {
  return _then(_ServiceDetailsEntered(
details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ScheduleConfirmed implements BookingState {
  const _ScheduleConfirmed({required this.details, required this.scheduledDate});


 final  String details;
 final  DateTime scheduledDate;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleConfirmedCopyWith<_ScheduleConfirmed> get copyWith => __$ScheduleConfirmedCopyWithImpl<_ScheduleConfirmed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleConfirmed&&(identical(other.details, details) || other.details == details)&&(identical(other.scheduledDate, scheduledDate) || other.scheduledDate == scheduledDate));
}


@override
int get hashCode => Object.hash(runtimeType,details,scheduledDate);

@override
String toString() {
  return 'BookingState.scheduleConfirmed(details: $details, scheduledDate: $scheduledDate)';
}


}

/// @nodoc
abstract mixin class _$ScheduleConfirmedCopyWith<$Res> implements $BookingStateCopyWith<$Res> {
  factory _$ScheduleConfirmedCopyWith(_ScheduleConfirmed value, $Res Function(_ScheduleConfirmed) _then) = __$ScheduleConfirmedCopyWithImpl;
@useResult
$Res call({
 String details, DateTime scheduledDate
});




}
/// @nodoc
class __$ScheduleConfirmedCopyWithImpl<$Res>
    implements _$ScheduleConfirmedCopyWith<$Res> {
  __$ScheduleConfirmedCopyWithImpl(this._self, this._then);

  final _ScheduleConfirmed _self;
  final $Res Function(_ScheduleConfirmed) _then;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? details = null,Object? scheduledDate = null,}) {
  return _then(_ScheduleConfirmed(
details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String,scheduledDate: null == scheduledDate ? _self.scheduledDate : scheduledDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class _Success implements BookingState {
  const _Success({required this.bookingId});


 final  String bookingId;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId));
}


@override
int get hashCode => Object.hash(runtimeType,bookingId);

@override
String toString() {
  return 'BookingState.success(bookingId: $bookingId)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $BookingStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 String bookingId
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bookingId = null,}) {
  return _then(_Success(
bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Failure implements BookingState {
  const _Failure({required this.message});


 final  String message;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'BookingState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $BookingStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Updating implements BookingState {
  const _Updating({required this.currentStatus});


 final  String currentStatus;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatingCopyWith<_Updating> get copyWith => __$UpdatingCopyWithImpl<_Updating>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Updating&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus));
}


@override
int get hashCode => Object.hash(runtimeType,currentStatus);

@override
String toString() {
  return 'BookingState.updating(currentStatus: $currentStatus)';
}


}

/// @nodoc
abstract mixin class _$UpdatingCopyWith<$Res> implements $BookingStateCopyWith<$Res> {
  factory _$UpdatingCopyWith(_Updating value, $Res Function(_Updating) _then) = __$UpdatingCopyWithImpl;
@useResult
$Res call({
 String currentStatus
});




}
/// @nodoc
class __$UpdatingCopyWithImpl<$Res>
    implements _$UpdatingCopyWith<$Res> {
  __$UpdatingCopyWithImpl(this._self, this._then);

  final _Updating _self;
  final $Res Function(_Updating) _then;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentStatus = null,}) {
  return _then(_Updating(
currentStatus: null == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
