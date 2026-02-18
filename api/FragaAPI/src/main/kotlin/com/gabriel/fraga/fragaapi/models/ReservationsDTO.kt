package com.gabriel.fraga.fragaapi.models

data class ReservationsDTO (
    val id: String,
    val idUser: String,
    val idActivity: String,
    val realizada: Boolean,
)