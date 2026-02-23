package com.gabriel.fraga.fragaapi.services

import com.gabriel.fraga.fragaapi.models.ActivityModel
import com.gabriel.fraga.fragaapi.models.ReservationsDTO
import com.gabriel.fraga.fragaapi.models.ReservationsModel
import com.gabriel.fraga.fragaapi.repositories.ReservationsRepository
import com.gabriel.fraga.fragaapi.utils.ReservationUtils
import org.bson.types.ObjectId
import org.springframework.stereotype.Service

@Service
class ReservationsService(private val repository: ReservationsRepository )  {
    private val utils = ReservationUtils()
    fun findByAll(): List<ReservationsModel> = repository.findAll()

    fun findById(id: String ): ReservationsModel? = repository.findById(id).orElse(null)

    fun findByUserId(userId: ObjectId): List<ReservationsDTO> {

        val reservas = repository.findByIdUser(userId)

        return utils.parseListIdToStrings(reservas)
    }

    fun createReserva(idUser: ObjectId, idActivity: ObjectId): Boolean {
        val reservation = ReservationsModel(
            null,
            idUser,
            idActivity,
            "asistencia"
        )
        repository.save(reservation)
        return true
    }

    fun cancelarReserva(idUser: ObjectId, idActivity: ObjectId): Boolean? {
        val reservation =  repository.deleteByIdUserAndIdActivity(idUser, idActivity)
        if (reservation == 0L) return false
        return true
    }

    fun noAsistirReserva(idUser: ObjectId, idActivity: ObjectId): ReservationsModel? {
        var reserva = repository.findByIdUserAndIdActivity(idUser, idActivity);

        reserva.estado = "no asistida"
        return repository.save(reserva)
    }




}