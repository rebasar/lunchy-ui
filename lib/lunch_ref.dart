import 'package:lunchy_ui/lunch.dart';

enum LunchLoadingState {
  NOT_LOADED,
  LOADED,
  ERROR
}

class LunchRef {
  Lunch lunch = null;
  LunchLoadingState state = LunchLoadingState.NOT_LOADED;

  bool isPending(){
    return this.state == LunchLoadingState.NOT_LOADED;
  }

  bool isLoaded(){
    return this.state == LunchLoadingState.LOADED;
  }

  bool isError(){
    return this.state == LunchLoadingState.ERROR;
  }

  void success(final Lunch lunch){
    this.lunch = lunch;
    this.state = LunchLoadingState.LOADED;
  }

  void error(){
    this.lunch = null;
    this.state = LunchLoadingState.ERROR;
  }

  void reset(){
    this.lunch = null;
    this.state = LunchLoadingState.NOT_LOADED;
  }
}