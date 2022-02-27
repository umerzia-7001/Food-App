// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Auth on _Auth, Store {
  final _$isEmailLoadingAtom = Atom(name: '_Auth.isEmailLoading');

  @override
  bool get isEmailLoading {
    _$isEmailLoadingAtom.reportRead();
    return super.isEmailLoading;
  }

  @override
  set isEmailLoading(bool value) {
    _$isEmailLoadingAtom.reportWrite(value, super.isEmailLoading, () {
      super.isEmailLoading = value;
    });
  }

  final _$isEmailDoneAtom = Atom(name: '_Auth.isEmailDone');

  @override
  bool get isEmailDone {
    _$isEmailDoneAtom.reportRead();
    return super.isEmailDone;
  }

  @override
  set isEmailDone(bool value) {
    _$isEmailDoneAtom.reportWrite(value, super.isEmailDone, () {
      super.isEmailDone = value;
    });
  }

  final _$emailLoginAsyncAction = AsyncAction('_Auth.emailLogin');

  @override
  Future<void> emailLogin(BuildContext context, String email, String password) {
    return _$emailLoginAsyncAction
        .run(() => super.emailLogin(context, email, password));
  }

  @override
  String toString() {
    return '''
isEmailLoading: ${isEmailLoading},
isEmailDone: ${isEmailDone}
    ''';
  }
}
