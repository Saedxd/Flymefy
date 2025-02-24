// login persional user
import 'package:get_it/get_it.dart';
import 'package:flymefy/core/di/home_factory.dart';
import 'package:flymefy/core/di/locator.dart';
import 'package:flymefy/core/service/permission.dart';
import 'package:flymefy/core/service/picker_photos.dart';
import 'package:flymefy/features/auth/data/repository_impl/auth_repository_impl.dart';
import 'package:flymefy/features/auth/domain/repository/auth_repository.dart';
import 'package:flymefy/features/auth/domain/usecase/forget_password_use_case.dart';
import 'package:flymefy/features/auth/domain/usecase/login_use_case.dart';
import 'package:flymefy/features/auth/domain/usecase/register_use_case.dart';
import 'package:flymefy/features/auth/logic/forget_password/forget_password_cubit.dart';
import 'package:flymefy/features/auth/logic/login_persional_use/login_persional_use_cubit.dart';
import 'package:flymefy/features/auth/logic/opt/otp_cubit.dart';

import '../../features/auth/logic/opt_register/otp__register_cubit.dart';
import '../../features/auth/logic/register_persional_use/regiter_persional_use_cubit.dart';


void authData() {
  if (!GetIt.I.isRegistered<AuthRepository>()) {
    instance.registerFactory<AuthRepository>(() => AuthRepositoryImpl(
        authApi: instance(),
        networkInfo: instance(),
        appPreferences: instance()));
  }
}

// void getUnitChatMessagesTenantFactory() {
//   if (!GetIt.I.isRegistered<ChatRepository>()) {
//     instance.registerFactory<ChatRepository>(() => ChatRepositoryImpl(
//           clientApi: instance(),
//         ));
//   }

//   if (!GetIt.I.isRegistered<GetUnitChatMessagesTenantUseCase>()) {
//     instance.registerFactory<GetUnitChatMessagesTenantUseCase>(
//         () => GetUnitChatMessagesTenantUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<GetUnitChatMessagesRentedUseCase>()) {
//     instance.registerFactory<GetUnitChatMessagesRentedUseCase>(
//         () => GetUnitChatMessagesRentedUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<SendUnitMessageByRentedUseCase>()) {
//     instance.registerFactory<SendUnitMessageByRentedUseCase>(
//         () => SendUnitMessageByRentedUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<SendUnitMessageByTenantUseCase>()) {
//     instance.registerFactory<SendUnitMessageByTenantUseCase>(
//         () => SendUnitMessageByTenantUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<PusherConfig>()) {
//     instance.registerFactory<PusherConfig>(() => PusherConfig());
//   }
//   // if (!GetIt.I.isRegistered<ImagePickering>()) {
//   //   instance.registerFactory<ImagePickering>(() => ImagePickerImpl(
//   //         instance(),
//   //       ));
//   // }

//   if (!GetIt.I.isRegistered<UnitChatMessagesCubit>()) {
//     instance.registerFactory<UnitChatMessagesCubit>(() => UnitChatMessagesCubit(
//           getUnitChatMessagesRentedUseCase: instance(),
//           getUnitChatMessagesTenantUseCase: instance(),
//           sendUnitMessageByTenantUseCase: instance(),
//           sendUnitMessageByRentedUseCase: instance(),
//           pusherConfig: instance(),
//           // imagePicker: instance(),
//         ));
//   }
// }

// getUnitChatsBothTypeRentedFactory() {
//   if (!GetIt.I.isRegistered<ChatRepository>()) {
//     instance.registerFactory<ChatRepository>(() => ChatRepositoryImpl(
//           clientApi: instance(),
//         ));
//   }

//   if (!GetIt.I.isRegistered<GetAllChatsForConfirmedGuestsRentedUseCase>()) {
//     instance.registerFactory<GetAllChatsForConfirmedGuestsRentedUseCase>(() =>
//         GetAllChatsForConfirmedGuestsRentedUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<GetAllChatsForAllUnitsRentedUseCase>()) {
//     instance.registerFactory<GetAllChatsForAllUnitsRentedUseCase>(
//         () => GetAllChatsForAllUnitsRentedUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<BothTypeChatsForRentedCubit>()) {
//     instance.registerFactory<BothTypeChatsForRentedCubit>(
//         () => BothTypeChatsForRentedCubit(
//               getAllChatsForAllUnitsRentedUseCase: instance(),
//               getAllChatsForConfirmedGuestsRentedUseCase: instance(),
//             ));
//   }



// }
