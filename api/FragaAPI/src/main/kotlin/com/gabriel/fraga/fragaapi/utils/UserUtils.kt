package com.gabriel.fraga.fragaapi.utils

import com.gabriel.fraga.fragaapi.models.UserDTO
import com.gabriel.fraga.fragaapi.models.UserModel
import com.gabriel.fraga.fragaapi.services.UsersService
import org.springframework.security.core.userdetails.UserDetails

class UserUtils(private val service: UsersService) {

    /**
     *
     * Esta funcion valida los datos del ususario
     * El campo exist valida si tiene que devolver si son campos que tienen que existir o no
     */
     fun checkUserData(user: UserModel, exist: Boolean): Boolean {
         //Nombre
        checkAndSanitizeUserData("nombre", user.nombre)
        //Email
        if(!exist) {
            checkAndSanitizeUserData("email", user.email, false)
        } else {
            checkAndSanitizeUserData("email", user.email, true)
        }
        // Password
        checkAndSanitizeUserData("password", user.password)
        //rol
        checkAndSanitizeUserData("rol", user.rol)

        return true
    }
    fun filterSanitizeUserData(user: UserModel) {

        user.nombre.sanitezeText().sanitizeDangerous()
        user.email.sanitizeEmail().sanitizeDangerous()
        if (!user.apellidos.isNullOrBlank()) user.apellidos.sanitezeText().sanitizeDangerous()



    }

    fun checkAndSanitizeUserData(type: String , value: Any?, exist: Boolean = false): Boolean {
        when(type) {
            "nombre" -> {
                value.toString().sanitezeText().sanitizeDangerous()
                if (value.toString().isNullOrBlank()) ExceptionUtils.UserNameException("El nombre no puede estar vacio")

            }
            "email" ->  {
                value.toString().sanitizeEmail().sanitizeDangerous()

                if (value.toString().isEmpty()) ExceptionUtils.EmailException("El email no puede estar vacio")
                if (!value.toString().contains("@") || !value.toString().contains(".")) ExceptionUtils.EmailException("El email no cumple con los requisitos")

                if(!exist) {
                    if (service.findUserEmail((value.toString()))) ExceptionUtils.EmailException("El email ya existe")
                } else {
                    if (!service.findUserEmail(value.toString())) ExceptionUtils.EmailException("El email no existe existe")
                }
                return true
            }
            "password" -> {
                value.toString().sanitizeDangerous()
                if(value.toString().isNullOrBlank()) ExceptionUtils.PasswordException("El password no puede estar vacio")

            }
            "rol" -> {
                value.toString().sanitizeDangerous()
                if(value.toString().isNullOrBlank()) ExceptionUtils.RolesException("El campo rol no puede estar vacio")
                if(value.toString() != "admin" && value != "usuario") ExceptionUtils.RolesException("${value.toString()} no es un rol permitido")
            }
        }

        return false
    }
}

