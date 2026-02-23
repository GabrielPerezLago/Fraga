import 'package:fraga_movile/models/ActivityModel.dart';
import 'package:fraga_movile/objects/SESSION.dart';
import 'package:fraga_movile/services/ApiService.dart';

class ActivitiesService {
  Future<List<ActivityModel>> getAllActivities() {
    return ApiService.getActivities();
  }

  Future<List<ActivityModel>> getActivitiesUser() {
    return ApiService.getActivitiesByUser();
  }

  Future<List<ActivityModel>> getActivitiesNoReservations() {
    return ApiService.getActivitiesNoReserve();
  }

  Future<void> reservate(String idActivity) {
    return ApiService.reserve(SESSION.instance.u?.id ?? "", idActivity);
  }

  Future<void> cancelar(String idActivity) {
    return ApiService.cancelar(SESSION.instance.u?.id ?? "", idActivity );
  }

  Future<void> eliminar(String idActivity) {
    return ApiService.eliminar(idActivity);
  }

  Future<ActivityModel> crear(String nombre, String descripcion, String fecha, int plazas, String image)  {
    return ApiService.create(nombre, descripcion, fecha, plazas, image);
  }
}