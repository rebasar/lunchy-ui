// Copyright (c) 2017, reb. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';
import 'package:angular2_components/src/model/action/async_action.dart';
import 'package:lunchy_ui/clipboard_service.dart';
import 'package:lunchy_ui/lunch.dart';
import 'package:lunchy_ui/lunch_place.dart';
import 'package:lunchy_ui/lunch_ref.dart';
import 'package:lunchy_ui/lunch_repository.dart';
import 'package:lunchy_ui/lunchy_service.dart';

@Component(
  selector: 'lunchy',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [materialDirectives],
  providers: const [
    materialProviders, LunchyService, LunchRepository, ClipboardService],
)
class AppComponent implements OnInit {
  final LunchyService _lunchyService;
  final LunchRepository _lunchRepository;
  final ClipboardService _clipboardService;
  List<LunchPlace> lunchPlaces;

  AppComponent(this._lunchyService, this._lunchRepository,
      this._clipboardService);

  @override
  ngOnInit() {
    _lunchyService.getLunchPlaces().then((lp) => this.lunchPlaces = lp);
  }

  open(final AsyncAction<bool> action, final LunchPlace place) {
    if (isPending(place)) {
      _lunchyService.getLunches(place.uri)
          .then((l) => _lunchRepository.get(place.name).success(l))
          .catchError((err) => _lunchRepository.get(place.name).error());
    }
  }

  Lunch getLunch(final String placeName) {
    return _lunchRepository
        .get(placeName)
        .lunch;
  }

  LunchLoadingState getState(final String placeName) {
    return _lunchRepository
        .get(placeName)
        .state;
  }

  bool isLoaded(final LunchPlace place) {
    return getState(place.name) == LunchLoadingState.LOADED;
  }

  bool isError(final LunchPlace place) {
    return getState(place.name) == LunchLoadingState.ERROR;
  }

  bool isPending(final LunchPlace place) {
    return getState(place.name) == LunchLoadingState.NOT_LOADED;
  }

  void copy(final event, final String placeName){
    final lunchRef = _lunchRepository.get(placeName);
    if(lunchRef.isLoaded()){
      _clipboardService.copy(lunchRef.lunch);
    }
  }
}
