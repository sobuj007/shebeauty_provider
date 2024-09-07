import '../repository/store_profile_repository.dart';

abstract class StoreProfileUseCase {
  final StoreProfileRepository expartCreateRepository;

  StoreProfileUseCase(this.expartCreateRepository);
}

