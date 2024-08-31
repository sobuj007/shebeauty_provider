import '../repository/experts_create_repository.dart';

abstract class ExpartCreateUseCase {
  final ExpartCreateRepository expartCreateRepository;

  ExpartCreateUseCase(this.expartCreateRepository);
}

