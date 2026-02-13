package com.gabriel.fraga.fragaapi.utils

import com.gabriel.fraga.fragaapi.models.UserModel
import com.gabriel.fraga.fragaapi.services.UsersService

class UserUtils(private val service: UsersService) {

    /**
     *
     * Esta funcion valida los datos del ususario
     * El campo exist valida si tiene que devolver si son campos que tienen que existir o no
     */
     fun checkUserData(user: UserModel, exist: Boolean): Boolean {
        if (user.nombre.isNullOrBlank()) ExceptionUtils.UserNameException("El nombre no puede estar vacio")

        if (exist) if (!service.isExistUserName(user.nombre)) ExceptionUtils.UserNameException("El nombre no existe")

        if(user.email.isNullOrBlank()) ExceptionUtils.EmailException("El email no puede estar vacio")

        if(!user.email.contains("@") || !user.email.contains(".")) ExceptionUtils.EmailException("El campo email no contiene datos validos")

        if(!exist) {
            if (service.findUserEmail(user.email)) ExceptionUtils.EmailException("El email ya existe")
        } else {
            if (!service.findUserEmail(user.email)) ExceptionUtils.EmailException("El email no existe existe")
        }

        if (user.password.isNullOrBlank()) ExceptionUtils.PasswordException("El password no puede estar vacio")


        return true
    }


    fun filterSanitizeUserData(user: UserModel) {

        user.nombre.sanitezeText().sanitizeDangerous()
        user.email.sanitizeEmail().sanitizeDangerous()
        if (!user.apellidos.isNullOrBlank()) user.apellidos.sanitezeText().sanitizeDangerous()



    }
}

