abstract class NewsStates {}

 class NewsInitialState extends NewsStates {}


class NewsGetBusinessLoadingState extends NewsStates{}
class NewsGetBusinessSuccessState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates{
 late final String error;
 NewsGetBusinessErrorState(this.error);
 }

class NewsGetSportsLoadingState extends NewsStates{}
class NewsGetSportsSuccessState extends NewsStates{}
class NewsGetSportsErrorState extends NewsStates{
 late final String error;
 NewsGetSportsErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsStates{}
class NewsGetScienceSuccessState extends NewsStates{}
class NewsGetScienceErrorState extends NewsStates{
 late final String error;
 NewsGetScienceErrorState(this.error);
}

class NewsGetHealthLoadingState extends NewsStates{}
class NewsGetHealthSuccessState extends NewsStates{}
class NewsGetHealthErrorState extends NewsStates{
 late final String error;
 NewsGetHealthErrorState(this.error);
}

class NewsGetTechnologyLoadingState extends NewsStates{}
class NewsGetTechnologySuccessState extends NewsStates{}
class NewsGetTechnologyErrorState extends NewsStates{
 late final String error;
 NewsGetTechnologyErrorState(this.error);
}

class NewsGetEntertainmentLoadingState extends NewsStates{}
class NewsGetEntertainmentSuccessState extends NewsStates{}
class NewsGetEntertainmentErrorState extends NewsStates{
 late final String error;
 NewsGetEntertainmentErrorState(this.error);
}

class NewsGetSearchLoadingState extends NewsStates{}
class NewsGetSearchSuccessState extends NewsStates{}
class NewsGetSearchErrorState extends NewsStates {
 late final String error;
 NewsGetSearchErrorState(this.error);
}



class NewsChangePageState extends NewsStates{}

class NewsChangeAppModeState extends NewsStates{}


