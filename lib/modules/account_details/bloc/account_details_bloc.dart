import 'package:akudo_task/modules/account_details/bloc/account_details_event.dart';
import 'package:akudo_task/modules/account_details/bloc/account_details_state.dart';
import 'package:akudo_task/modules/account_details/models/user_model.dart';
import 'package:akudo_task/modules/account_details/repos/user_repository.dart';
import 'package:akudo_task/modules/transaction/view/loading_view.dart';
import 'package:bloc/bloc.dart';

class AccountDetailsBloc extends Bloc<AccountDetailsEvent,AccountDetailsState> {
  final UserRepository userRepository;
  AccountDetailsBloc({this.userRepository}) : assert(userRepository!=null), super(null);

  AccountDetailsState get initialState => AccountInitState();

  @override
  Stream<AccountDetailsState> mapEventToState(AccountDetailsEvent event) async* {
    if(event is LoadUserDetailsEvent){
      User user = await userRepository.getUserDetails();
      yield UserDetailsLoadedState(userDetails: user);
    }
    else if(event is AddUserFriendEvent){
      await userRepository.addUserFriend(event.friendId);
      yield UserDetailsLoadingState();
    }
  }

}