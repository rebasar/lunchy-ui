import 'package:angular2/core.dart';
import 'package:lunchy_ui/lunch_ref.dart';

@Injectable()
class LunchRepository {
  final Map<String, LunchRef> data = new Map<String, LunchRef>();

  LunchRef get(final String name){
    if(!data.containsKey(name)) {
      data[name] = new LunchRef();
    }
    return data[name];
  }
}