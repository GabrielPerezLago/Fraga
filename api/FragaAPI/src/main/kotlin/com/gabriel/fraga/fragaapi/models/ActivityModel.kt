package com.gabriel.fraga.fragaapi.models

import org.springframework.data.mongodb.core.mapping.Document
import java.util.Date

@Document(collection="activities")
data class ActivityModel(
    val id: String,
    val nombre: String,
    val descripcion: String,
    val fecha: Date,
    val plazas: Int
)