


abstract class VacationsStates {}

 class VacationsInitial extends VacationsStates {}



class GetVacationsLoadingState extends VacationsStates {}
class GetVacationsSuccessState extends VacationsStates {}
class GetVacationsErrorState extends VacationsStates {
  final String error;

  GetVacationsErrorState(this.error);
}


class AddVacationLoadingState extends VacationsStates {}
class AddVacationSuccessState extends VacationsStates {}

class AddVacationErrorState extends VacationsStates {
  final String error;

  AddVacationErrorState(this.error);

}

class DeleteVacationLoadingState extends VacationsStates {}
class DeleteVacationSuccessState extends VacationsStates {}

class DeleteVacationErrorState extends VacationsStates {
  final String error;

  DeleteVacationErrorState(this.error);

}

class UpdateVacationLoadingState extends VacationsStates {}
class UpdateVacationSuccessState extends VacationsStates {}

class UpdateVacationErrorState extends VacationsStates {
  final String error;

  UpdateVacationErrorState(this.error);
}