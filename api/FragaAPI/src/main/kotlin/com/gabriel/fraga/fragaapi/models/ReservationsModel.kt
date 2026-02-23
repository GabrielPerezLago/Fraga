package com.gabriel.fraga.fragaapi.models

import org.bson.types.ObjectId
import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.Document
import java.io.ObjectInput

@Document(collection="reservations")
data class ReservationsModel(
    @Id
    val id: String? = null,
    val idUser: ObjectId? = null,
    val idActivity: ObjectId? = null,
    var estado: String?,
)
