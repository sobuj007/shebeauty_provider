import '../repository/service_repository.dart';

abstract class ServiceUseCase {
  final ServiceRepository expartCreateRepository;

  ServiceUseCase(this.expartCreateRepository);
}

