import 'package:dio/dio.dart';
import 'package:myb_app/domain/entities/messages.dart';
import 'package:myb_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonMap(response.data); 
    return yesNoModel.toMessageEntity(); 
  }
}
