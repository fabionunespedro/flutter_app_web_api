import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends InterceptorContract {
  final Logger logger = Logger();

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    logger.v(
      "Requisição para ${request.url}\n"
      "Cabeçalhos: ${request.headers}",
    );

    // Verifique se há um corpo na requisição antes de logá-lo
    if (request is Request) {
      logger.v("Corpo: ${request.body}");
    }

    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({required BaseResponse response}) async {
    logger.i(
      "Resposta de ${response.url}\n"
      "Status: ${response.statusCode}\n"
      "Cabeçalhos: ${response.headers}",
    );

    // Verifique se há um corpo na resposta antes de logá-lo
    if (response is Response) {
      logger.i("Corpo: ${response.body}");
    }

    return response;
  }
}

extension on BaseResponse {
  get url => null;
}
