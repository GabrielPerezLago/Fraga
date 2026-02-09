package com.gabriel.fraga.fragaapi.services

import com.gabriel.fraga.fragaapi.models.ReservationsModel
import com.gabriel.fraga.fragaapi.repositories.ReservationsRepository
import org.springframework.stereotype.Service

@Service
class ReservationsService(private val repository: ReservationsRepository)  {
    fun findByAll(): List<ReservationsModel> = repository.findAll()
}