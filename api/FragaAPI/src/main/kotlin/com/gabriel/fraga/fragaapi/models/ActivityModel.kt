package com.gabriel.fraga.fragaapi.models

import org.springframework.data.mongodb.core.mapping.Document
import java.time.LocalDate
import java.time.LocalDateTime

@Document(collection="activities")
data class ActivityModel(
    val id: String? = null,
    val nombre: String,
    val descripcion: String,
    val fecha: LocalDateTime,
    val realizada: Boolean,
    var plazas: Int,
    val image: String
)