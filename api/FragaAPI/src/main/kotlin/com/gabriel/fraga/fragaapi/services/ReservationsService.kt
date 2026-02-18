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



}