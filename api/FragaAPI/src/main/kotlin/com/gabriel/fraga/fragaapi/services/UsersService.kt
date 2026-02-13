package com.gabriel.fraga.fragaapi.services

import com.gabriel.fraga.fragaapi.models.UserModel
import com.gabriel.fraga.fragaapi.repositories.UsersRepository
import com.gabriel.fraga.fragaapi.utils.UserUtils
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.stereotype.Service
import java.util.Date

@Service
class UsersService(private val usersRepo: UsersRepository, private val passEncoder: PasswordEncoder) {
    private val utils = UserUtils(this)
    fun findAll(): List<UserModel> {
        return usersRepo.findAll()
    }

    fun findUser(email: String?, password: String?): UserModel? {
        val hash: String? = passEncoder.encode(password)
        return usersRepo.findByEmailAndPassword(email, password)
    }

    fun create(nombre: String?, email: String?,  password: String?,  nacimiento: Date?,  rol: String?): UserModel {

        val user = UserModel(
            id = null ,
            nombre = nombre!!,
            apellidos =null,
            email = email!!,
            password = passEncoder.encode(password),
            nacimiento = nacimiento!!,
            rol = rol!!
        )
        utils.filterSanitizeUserData(user)
        utils.checkUserData(user, false)
        return usersRepo.save(user)
    }

    fun isExistUserName(name: String): Boolean = usersRepo.existsByNombre(name)
    fun findUserEmail(email: String): Boolean = usersRepo.existsByEmail(email)




}