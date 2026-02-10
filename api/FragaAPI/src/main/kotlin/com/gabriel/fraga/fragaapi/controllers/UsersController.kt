package com.gabriel.fraga.fragaapi.controllers

import com.gabriel.fraga.fragaapi.models.UserModel
import com.gabriel.fraga.fragaapi.services.UsersService
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController


@RestController
@RequestMapping("/usuarios")
@CrossOrigin(origins = ["*"])
class UsersController(private val service: UsersService) {


    @GetMapping("")
    fun findAll(): List<UserModel> {
        return service.findAll()
    }

    @PostMapping("/login")
    fun login(email: String, password: String): UserModel? {
        return service.findUser(email, password)
    }
}
