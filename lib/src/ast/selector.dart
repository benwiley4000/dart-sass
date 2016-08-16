// Copyright 2016 Google Inc. Use of this source code is governed by an
// MIT-style license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import '../visitor/interface/selector.dart';
import '../visitor/serialize.dart';

export 'selector/attribute.dart';
export 'selector/class.dart';
export 'selector/complex.dart';
export 'selector/compound.dart';
export 'selector/id.dart';
export 'selector/list.dart';
export 'selector/namespaced_identifier.dart';
export 'selector/parent.dart';
export 'selector/placeholder.dart';
export 'selector/pseudo.dart';
export 'selector/simple.dart';
export 'selector/type.dart';
export 'selector/universal.dart';

abstract class Selector {
  /*=T*/ accept/*<T>*/(SelectorVisitor/*<T>*/ visitor);

  String toString() => selectorToCss(this);
}
