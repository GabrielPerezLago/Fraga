package com.gabriel.fraga.fragaapi.controllers

import com.gabriel.fraga.fragaapi.models.UserModel
import com.gabriel.fraga.fragaapi.services.UsersService
import com.gabriel.fraga.fragaapi.utils.ExceptionUtils
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController
import java.util.Date
import java.util.logging.Logger


@RestController
@RequestMapping("/usuarios")
@CrossOrigin(origins = ["*"])
class UsersController(private val service: UsersService) {


    @GetMapping("")
    fun findAll(): List<UserModel> {
        return service.findAll()
    }

    @PostMapping("/login")
    fun login(@RequestParam email: String?, @RequestParam password: String?): UserModel? {

        if( password.isNullOrBlank()) ExceptionUtils.PasswordException("El campo password llego vacia")

        if (email == "" || email == null ) ExceptionUtils.EmailException("El campo email llego vacio ")

        return service.findUser(email, password)
    }

    @PostMapping("/register")
    fun register(@RequestParam nombre: String?, @RequestParam email: String?, @RequestParam password: String?, @RequestParam nacimiento: Date?, @RequestParam rol: String?): UserModel? {


        val data = service.create(nombre, email, password, nacimiento, rol)

        if (data.id == null) ExceptionUtils.CreateException("No se ha podido registrar el usuario")
        return data
    }

}
