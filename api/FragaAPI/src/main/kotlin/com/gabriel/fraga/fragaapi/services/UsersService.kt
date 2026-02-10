package com.gabriel.fraga.fragaapi.services

import com.gabriel.fraga.fragaapi.models.UserModel
import com.gabriel.fraga.fragaapi.repositories.UsersRepository
import org.springframework.stereotype.Service

@Service
class UsersService(private val usersRepo: UsersRepository) {
    fun findAll(): List<UserModel>  {
       return usersRepo.findAll()
    }

    fun findUser(email: String, password: String): UserModel? {
        return usersRepo.findByEmailAndPassword(email, password)
    }
}