// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RegisterStateTearOff {
  const _$RegisterStateTearOff();

  _RegisterState call(
      {String email = '',
      String verifyemail = '',
      String password = '',
      String verifypassword = '',
      String name = '',
      String lastname = ''}) {
    return _RegisterState(
      email: email,
      verifyemail: verifyemail,
      password: password,
      verifypassword: verifypassword,
      name: name,
      lastname: lastname,
    );
  }
}

/// @nodoc
const $RegisterState = _$RegisterStateTearOff();

/// @nodoc
mixin _$RegisterState {
  String get email => throw _privateConstructorUsedError;
  String get verifyemail => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get verifypassword => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res>;
  $Res call(
      {String email,
      String verifyemail,
      String password,
      String verifypassword,
      String name,
      String lastname});
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  final RegisterState _value;
  // ignore: unused_field
  final $Res Function(RegisterState) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? verifyemail = freezed,
    Object? password = freezed,
    Object? verifypassword = freezed,
    Object? name = freezed,
    Object? lastname = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      verifyemail: verifyemail == freezed
          ? _value.verifyemail
          : verifyemail // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      verifypassword: verifypassword == freezed
          ? _value.verifypassword
          : verifypassword // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RegisterStateCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterStateCopyWith(
          _RegisterState value, $Res Function(_RegisterState) then) =
      __$RegisterStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String email,
      String verifyemail,
      String password,
      String verifypassword,
      String name,
      String lastname});
}

/// @nodoc
class __$RegisterStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res>
    implements _$RegisterStateCopyWith<$Res> {
  __$RegisterStateCopyWithImpl(
      _RegisterState _value, $Res Function(_RegisterState) _then)
      : super(_value, (v) => _then(v as _RegisterState));

  @override
  _RegisterState get _value => super._value as _RegisterState;

  @override
  $Res call({
    Object? email = freezed,
    Object? verifyemail = freezed,
    Object? password = freezed,
    Object? verifypassword = freezed,
    Object? name = freezed,
    Object? lastname = freezed,
  }) {
    return _then(_RegisterState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      verifyemail: verifyemail == freezed
          ? _value.verifyemail
          : verifyemail // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      verifypassword: verifypassword == freezed
          ? _value.verifypassword
          : verifypassword // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegisterState implements _RegisterState {
  _$_RegisterState(
      {this.email = '',
      this.verifyemail = '',
      this.password = '',
      this.verifypassword = '',
      this.name = '',
      this.lastname = ''});

  @JsonKey(defaultValue: '')
  @override
  final String email;
  @JsonKey(defaultValue: '')
  @override
  final String verifyemail;
  @JsonKey(defaultValue: '')
  @override
  final String password;
  @JsonKey(defaultValue: '')
  @override
  final String verifypassword;
  @JsonKey(defaultValue: '')
  @override
  final String name;
  @JsonKey(defaultValue: '')
  @override
  final String lastname;

  @override
  String toString() {
    return 'RegisterState(email: $email, verifyemail: $verifyemail, password: $password, verifypassword: $verifypassword, name: $name, lastname: $lastname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegisterState &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.verifyemail, verifyemail) ||
                const DeepCollectionEquality()
                    .equals(other.verifyemail, verifyemail)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.verifypassword, verifypassword) ||
                const DeepCollectionEquality()
                    .equals(other.verifypassword, verifypassword)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality()
                    .equals(other.lastname, lastname)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(verifyemail) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(verifypassword) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(lastname);

  @JsonKey(ignore: true)
  @override
  _$RegisterStateCopyWith<_RegisterState> get copyWith =>
      __$RegisterStateCopyWithImpl<_RegisterState>(this, _$identity);
}

abstract class _RegisterState implements RegisterState {
  factory _RegisterState(
      {String email,
      String verifyemail,
      String password,
      String verifypassword,
      String name,
      String lastname}) = _$_RegisterState;

  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get verifyemail => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  String get verifypassword => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get lastname => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RegisterStateCopyWith<_RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}
