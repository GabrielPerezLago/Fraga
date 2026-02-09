package com.gabriel.fraga.fragaapi.repositories

import com.gabriel.fraga.fragaapi.models.ReservationsModel
import org.springframework.data.mongodb.repository.MongoRepository
import org.springframework.stereotype.Repository

interface ReservationsRepository: MongoRepository<ReservationsModel, String> {
}