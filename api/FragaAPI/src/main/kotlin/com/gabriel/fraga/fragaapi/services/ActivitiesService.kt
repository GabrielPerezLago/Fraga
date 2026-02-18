package com.gabriel.fraga.fragaapi.services

import com.gabriel.fraga.fragaapi.models.ActivityModel
import com.gabriel.fraga.fragaapi.models.ReservationsDTO
import com.gabriel.fraga.fragaapi.repositories.ActivitiesRepository
import com.gabriel.fraga.fragaapi.utils.sanitizeDate
import org.bson.types.ObjectId
import org.springframework.stereotype.Service
import java.util.Optional

@Service
class ActivitiesService(private val repo: ActivitiesRepository, private val reservatioService: ReservationsService) {
    fun findByAll() : List<ActivityModel>{
        return repo.findAll()
    }

    fun findById(activityID: String ): ActivityModel? = repo.findById(activityID).orElse(null)

    fun findResByUser(id: ObjectId): List<ActivityModel> {
        val reservas: List<ReservationsDTO> = reservatioService.findByUserId(id)
        var activities = ArrayList<ActivityModel>()

        for (reservation: ReservationsDTO in reservas) {
            var activity = this.findById(reservation.idActivity)
            if (activity != null ) {
                activity.fecha.sanitizeDate()
                activities.add(activity)
            }
        }

        return activities
    }

    fun findOnlyNoReserveActivities( userID: ObjectId ): List<ActivityModel> {
        val userActivities = this.findResByUser(userID)
        val activities = findByAll();

        if (userActivities.isNullOrEmpty()) return activities

        var activityList= ArrayList<ActivityModel>()

        for (ai: ActivityModel in activities) {
            for (aj: ActivityModel in userActivities) {
                if(ai.id !== ai.id ) {
                    activityList.add(ai)
                }
            }
        }

        return activityList

    }
}