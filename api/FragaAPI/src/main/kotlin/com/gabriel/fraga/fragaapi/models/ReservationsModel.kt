package com.gabriel.fraga.fragaapi.models

import org.springframework.data.mongodb.core.mapping.Document

@Document(collection="reservations")
data class ReservationsModel(
    val id: String,
    val idUser: String,
    val idActivity: String,
    val realizada: Boolean
)
