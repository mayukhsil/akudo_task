import 'package:akudo_task/modules/account_details/bloc/account_details_event.dart';
import 'package:akudo_task/modules/account_details/bloc/account_details_state.dart';
import 'package:akudo_task/modules/account_details/repos/user_repository.dart';
import 'package:bloc/bloc.dart';

class AccountDetailsBloc extends Bloc<AccountDetailsEvent,AccountDetailsState> {
  final UserRepository userRepository;
  AccountDetailsBloc({this.userRepository}) : assert(userRepository!=null), super(null);

  AccountDetailsState get initialState => LoadUserDetails();

  @override
  Stream<AccountDetailsState> mapEventToState(AccountDetailsEvent event) async* {

  }

}