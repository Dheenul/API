// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeScreenModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenModel on _HomeScreenModelBase, Store {
  late final _$loadingStatusAtom =
      Atom(name: '_HomeScreenModelBase.loadingStatus', context: context);

  @override
  bool get loadingStatus {
    _$loadingStatusAtom.reportRead();
    return super.loadingStatus;
  }

  @override
  set loadingStatus(bool value) {
    _$loadingStatusAtom.reportWrite(value, super.loadingStatus, () {
      super.loadingStatus = value;
    });
  }

  late final _$allAvengerAtom =
      Atom(name: '_HomeScreenModelBase.allAvenger', context: context);

  @override
  List<AvengerBO> get allAvenger {
    _$allAvengerAtom.reportRead();
    return super.allAvenger;
  }

  @override
  set allAvenger(List<AvengerBO> value) {
    _$allAvengerAtom.reportWrite(value, super.allAvenger, () {
      super.allAvenger = value;
    });
  }

  late final _$_HomeScreenModelBaseActionController =
      ActionController(name: '_HomeScreenModelBase', context: context);

  @override
  void setLoadingStatus({required bool loadingStatus}) {
    final _$actionInfo = _$_HomeScreenModelBaseActionController.startAction(
        name: '_HomeScreenModelBase.setLoadingStatus');
    try {
      return super.setLoadingStatus(loadingStatus: loadingStatus);
    } finally {
      _$_HomeScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataTAllAvengerList({required List<AvengerBO> avengerDetails}) {
    final _$actionInfo = _$_HomeScreenModelBaseActionController.startAction(
        name: '_HomeScreenModelBase.setDataTAllAvengerList');
    try {
      return super.setDataTAllAvengerList(avengerDetails: avengerDetails);
    } finally {
      _$_HomeScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loadingStatus: ${loadingStatus},
allAvenger: ${allAvenger}
    ''';
  }
}
