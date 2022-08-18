



abstract class MainState {}

class MainInitialeState extends MainState {}
class MainLoaddingState extends MainState {}
class MainSucssesState extends MainState {}
class MainErrorState extends MainState {
  final String error ;
  MainErrorState(this.error);

}

class MainSucssesGetFromDB extends MainState{}
class MainErrorGetFromDB extends MainState{}
class MainPlusCount extends MainState{}
class MainMinsCount extends MainState{}
class MainChangeStepCount extends MainState{}