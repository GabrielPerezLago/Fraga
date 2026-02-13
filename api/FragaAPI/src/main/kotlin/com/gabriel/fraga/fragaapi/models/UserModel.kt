package com.gabriel.fraga.fragaapi.models

import org.springframework.data.mongodb.core.mapping.Document
import java.util.Date

@Document(collection = "users")
data class UserModel(
    val id: String?,
    val nombre: String,
    val apellidos: String?,
    val email: String,
    val password: String?,
    val nacimiento: Date?,
    val rol: String
)
