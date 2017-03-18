// Copyright (c) 2017, reb. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/platform/browser.dart';
import 'package:angular2/core.dart';
import 'package:lunchy_ui/app_component.dart';
import 'package:http/browser_client.dart';


void main() {
  bootstrap(AppComponent, [provide(BrowserClient, useFactory: () => new BrowserClient(), deps: [])]);
}
