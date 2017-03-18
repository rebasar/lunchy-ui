import 'dart:html';

import 'package:angular2/angular2.dart';
import 'package:lunchy_ui/lunch.dart';

@Injectable()
class ClipboardService {
  void copy(final Lunch lunch){
    final TextAreaElement textArea = document.createElement("textarea");
    textArea.value = _render(lunch);
    document.body.append(textArea);
    textArea.focus();
    textArea.select();
    document.execCommand("copy");
    textArea.blur();
    textArea.remove();
  }

  String _render(Lunch lunch) {
    return lunch.items.map((item) => item.toMarkdown()).join("\n");
  }
}