import '../repository/myslot_creation_repository.dart';

abstract class MySlotCreateUseCase {
  final MySlotCreateRepository regRepository;

  MySlotCreateUseCase(this.regRepository);
}
abstract class AppointmentCreateUseCase {
  final MySlotCreateRepository regRepository;

  AppointmentCreateUseCase(this.regRepository);
}

abstract class MySlotListUseCase {
  final MySlotCreateRepository regRepository;

  MySlotListUseCase(this.regRepository);
}

