package com.gabriel.fraga.fragaapi.models

import java.util.Date

data class UserDTO (
    val token: String?,
    val id: String?,
    val nombre: String,
    val apellido: String?,
    val email: String,
    val nacimiento: String?,
    val rol: String,
)