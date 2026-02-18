package com.gabriel.fraga.fragaapi.repositories

import com.gabriel.fraga.fragaapi.models.ReservationsModel
import org.bson.types.ObjectId
import org.springframework.data.mongodb.repository.MongoRepository

interface ReservationsRepository: MongoRepository<ReservationsModel, String> {
    fun findByIdUser(userID: ObjectId): List<ReservationsModel>
}