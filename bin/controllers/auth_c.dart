import 'dart:convert';
import 'dart:typed_data';
import 'package:shelf/shelf.dart';
import '../models/otp_m.dart';
import '../models/response_m.dart';
import '../models/user_m.dart';
import '../repositories/auth_repository.dart';
import '../utils/app_response.dart';
import 'package:shelf_multipart/form_data.dart';

class AuthController {
  static fnPostSignin(Request request) async {
    final body = json.decode(await request.readAsString());
    final response =
        await AuthRepository().signin(body['email'], body['password']);
    if (response!.data != null) {
      final data =
          ResponseM(status: 200, message: 'Success', data: response.data);
      return AppResponse.response(200, jsonEncode(data));
    } else if (response.statusCode == 200) {
      return AppResponse.response(
          200, jsonEncode({'message': response.error!.message}));
    } else if (response.statusCode == 404) {
      return AppResponse.response(
          400, jsonEncode({'message': 'route tidak ditemukan'}));
    } else {
      return AppResponse.response(
          500, jsonEncode({'message': 'Gagal terhubung keserver'}));
    }
  }

  static fnPostSigninGoogle(Request request) async {
    final body = json.decode(await request.readAsString());
    final response =
        await AuthRepository().signin(body['email'], body['password']);
    if (response!.data != null) {
      final data =
          ResponseM(status: 200, message: 'Success', data: response.data);
      return AppResponse.response(200, jsonEncode(data));
    } else if (response.statusCode == 200) {
      return AppResponse.response(
          200, jsonEncode({'message': response.error!.message}));
    } else if (response.statusCode == 404) {
      return AppResponse.response(
          400, jsonEncode({'message': 'route tidak ditemukan'}));
    } else {
      return AppResponse.response(
          500, jsonEncode({'message': 'Gagal terhubung keserver'}));
    }
  }

  static fnPostSigninWithPhone(Request request) async {
    final body = json.decode(await request.readAsString());
    final response = await AuthRepository().signinWithPhone(body['phone']);
    if (response!.data != null) {
      final data =
          ResponseM(status: 200, message: 'Success', data: response.data);
      return AppResponse.response(200, jsonEncode(data));
    } else if (response.statusCode == 200) {
      return AppResponse.response(
          200, jsonEncode({'message': response.error!.message}));
    } else if (response.statusCode == 404) {
      return AppResponse.response(
          404, jsonEncode({'message': 'route tidak ditemukan'}));
    } else {
      return AppResponse.response(
          500, jsonEncode({'message': 'Gagal terhubung keserver'}));
    }
  }

  static fnPostSignup(Request request) async {
    final user =
        UserM.fromJsonSignup(json.decode(await request.readAsString()));
    final response = await AuthRepository().signup(user.email!, user.password!);
    if (response != null) {
      if (response.data != null) {
        return AppResponse.response(
            200,
            jsonEncode(ResponseM(
                status: 200, message: 'Success', data: response.data)));
      } else {
        return AppResponse.response(
            403,
            jsonEncode(ResponseM(
                status: 403, message: response.error!.message, data: {})));
      }
    } else {
      return AppResponse.response(response!.statusCode!,
          jsonEncode({'message': response.error!.message}));
    }
  }

  static fnPostSignupWithPhone(Request request) async {
    print('WITH PHONE');
    final user =
        UserM.fromJsonSignup(json.decode(await request.readAsString()));
    final response =
        await AuthRepository().signupWithPhone(user.phone!, user.password!);
    if (response != null) {
      if (response) {
        return AppResponse.response(
          200,
          jsonEncode(
            ResponseM(
              status: 200,
              message: 'Nomor berhasil terdaftar',
              data: {},
            ),
          ),
        );
      } else {
        return AppResponse.response(
          403,
          jsonEncode(
            ResponseM(
              status: 403,
              message: 'Terjadi kesalahan silahkan coba beberapa saat lagi...',
              data: {},
            ),
          ),
        );
      }
    } else {
      return AppResponse.response(
        500,
        jsonEncode(
          ResponseM(
            status: 500,
            message: 'Terjadi kesalahan silahkan coba beberapa saat lagi...',
            data: {},
          ),
        ),
      );
    }
  }

  static fnPostVerifyOTP(Request request) async {
    final otpM = OtpM.fromJsonSignup(json.decode(await request.readAsString()));
    final response = await AuthRepository().verifiyOTP(otpM.phone!, otpM.otp!);
    if (response != null) {
      if (response.data != null) {
        return AppResponse.response(
            200,
            jsonEncode(ResponseM(
                status: 200, message: 'Success', data: response.data)));
      } else {
        return AppResponse.response(
            403,
            jsonEncode(ResponseM(
                status: 403, message: response.error!.message, data: {})));
      }
    } else {
      return AppResponse.response(response!.statusCode!,
          jsonEncode({'message': response.error!.message}));
    }
  }

  static fnUploadImage(Request request, String id) async {
    List<Map<String, dynamic>>? listParam = [];
    Uint8List? image;
    if (request.isMultipartForm) {
      await for (final formData in request.multipartFormData) {
        image = await formData.part.readBytes();
        listParam.add({formData.name: formData.filename ?? ''});
      }
      final response =
          await AuthRepository().uploadImage(listParam, image!, id);
      if (response != null) {
        if (response.hasError) {
          return AppResponse.response(403,
              jsonEncode({'status': 403, 'message': response.error!.message}));
        } else {
          return AppResponse.response(
              200,
              jsonEncode(ResponseM(
                  status: 200,
                  message: 'Upload image is successfull',
                  data: {})));
        }
      } else {
        return AppResponse.response(403,
            jsonEncode({'status': 403, 'message': response!.error!.message}));
      }
    } else {
      return AppResponse.response(
          403, jsonEncode({'status': 403, 'message': 'Image not found'}));
    }
  }
}
