package com.gabriel.fraga.fragaapi.models

import java.time.LocalDateTime

data class ActivityDTO(
    val id: String? = null,
    val nombre: String,
    val descripcion: String,
    val fecha: LocalDateTime,
    val realizada: Boolean,
    var plazas: Int,
    val image: String,
    val noAsist: Boolean = false,
)