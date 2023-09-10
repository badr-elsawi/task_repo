abstract class TodoStates {}
// initial state
class TodoInitialState extends TodoStates {}
// change pages state
class ChangePageState extends TodoStates {}
// users state
class GetUsersSuccessState extends TodoStates {}
class GetUsersErrorState extends TodoStates {}
// todos states
class GetTodosLoadingState extends TodoStates {}
class GetTodosSuccessState extends TodoStates {}
class GetTodosErrprState extends TodoStates {}
// filter state
class ChangeFilterState extends TodoStates {}
