package com.gabriel.fraga.fragaapi.models

import org.bson.types.ObjectId
import org.springframework.data.mongodb.core.mapping.Document
import java.io.ObjectInput

@Document(collection="reservations")
data class ReservationsModel(
    val id: String,
    val idUser: ObjectId? = null,
    val idActivity: ObjectId? = null,
    val realizada: Boolean
)
