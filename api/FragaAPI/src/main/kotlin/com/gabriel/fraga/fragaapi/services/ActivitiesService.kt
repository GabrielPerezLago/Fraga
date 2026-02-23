package com.gabriel.fraga.fragaapi.services

import com.gabriel.fraga.fragaapi.models.ActivityModel
import com.gabriel.fraga.fragaapi.models.ReservationsDTO
import com.gabriel.fraga.fragaapi.repositories.ActivitiesRepository
import com.gabriel.fraga.fragaapi.utils.ExceptionUtils
import com.gabriel.fraga.fragaapi.utils.sanitizeDate
import com.gabriel.fraga.fragaapi.utils.toLocalDateTimeStrict
import org.bson.types.ObjectId
import org.springframework.data.mongodb.core.aggregation.MergeOperation.UniqueMergeId.id
import org.springframework.format.annotation.DateTimeFormat
import org.springframework.stereotype.Service
import java.time.LocalDate
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
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
                activity.fecha
                activities.add(activity)
            }
        }

        return activities
    }

    fun findOnlyNoReserveActivities( userID: ObjectId ): List<ActivityModel> {
        val userActivities = this.findResByUser(userID)
        val activities = findByAll();

       val reservasId = userActivities.map { it.id }.toSet()
        return activities.filter { it.id !in reservasId }
    }

    fun cretateReserva(idUser: ObjectId, idActivity: ObjectId): Boolean {
        var activity: ActivityModel? = findById(idActivity.toString())
        if (activity == null) return false

        val isReserved: Boolean = reservatioService.createReserva(idUser, idActivity)
        if (!isReserved) return false

        activity.plazas = (activity.plazas ?: 0) - 1
        repo.save(activity)

        return true
    }

    fun updateReservaActivity(idUser: ObjectId, idActivity: ObjectId): Boolean {
        var activity = repo.findById(idActivity.toString()).orElse(null)

        if (activity == null) ExceptionUtils.sendActivityException("No se ha encontrado ninguna actividad")

        val hoy = LocalDateTime.now()

        if (hoy.isAfter(activity.fecha.minusMinutes(15))) {
            reservatioService.noAsistirReserva(idUser, idActivity)
        } else {
            reservatioService.cancelarReserva(idUser, idActivity)
        }

        return true
    }


    fun deleteActivity(id: String) {
        if (id.isNullOrBlank()) ExceptionUtils.sendActivityException("El id de la actividad no puede estar vacío")
        repo.deleteById(id)
    }

    fun createActivity(nombre: String, descripcion: String, fecha: String, plazas: Int, image: String ): ActivityModel {
        val activity = ActivityModel(
            null,
            nombre,
            descripcion,
            fecha.toLocalDateTimeStrict(),
            false,
            plazas,
            image
        )

        return repo.save(activity)
    }
}