import 'package:fraga_movile/models/ActivityModel.dart';
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
}