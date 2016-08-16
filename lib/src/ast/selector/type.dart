// Copyright 2016 Google Inc. Use of this source code is governed by an
// MIT-style license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import '../../extend/functions.dart';
import '../../visitor/interface/selector.dart';
import '../selector.dart';

class TypeSelector extends SimpleSelector {
  final NamespacedIdentifier name;

  int get minSpecificity => 1;

  TypeSelector(this.name);

  /*=T*/ accept/*<T>*/(SelectorVisitor/*<T>*/ visitor) =>
      visitor.visitTypeSelector(this);

  TypeSelector addSuffix(String suffix) => new TypeSelector(
      new NamespacedIdentifier(name.name + suffix, namespace: name.namespace));

  List<SimpleSelector> unify(List<SimpleSelector> compound) {
    if (compound.first is UniversalSelector || compound.first is TypeSelector) {
      var unified = unifyUniversalAndElement(this, compound.first);
      return [unified]..addAll(compound.skip(1));
    } else {
      return [this]..addAll(compound);
    }
  }

  bool operator==(other) => other is TypeSelector && other.name == name;

  int get hashCode => name.hashCode;
}
