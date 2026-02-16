package com.gabriel.fraga.fragaapi.services

import com.gabriel.fraga.fragaapi.models.UserDTO
import com.gabriel.fraga.fragaapi.models.UserModel
import com.gabriel.fraga.fragaapi.repositories.UsersRepository
import com.gabriel.fraga.fragaapi.security.JWTService
import com.gabriel.fraga.fragaapi.utils.ExceptionUtils
import com.gabriel.fraga.fragaapi.utils.UserUtils
import com.gabriel.fraga.fragaapi.utils.sanitezeText
import com.gabriel.fraga.fragaapi.utils.sanitizeDate
import io.jsonwebtoken.Claims
import org.apache.catalina.User
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.stereotype.Service
import java.util.Date

@Service
class UsersService(
    private val usersRepo: UsersRepository,
    private val passEncoder: PasswordEncoder,
    private val jWTService: JWTService
) {
    private val utils = UserUtils(this)
    fun findAll(): List<UserModel> {
        return usersRepo.findAll()
    }

    fun findUser(email: String?, password: String?): UserDTO? {
        utils.checkAndSanitizeUserData("email", email, true)
        val usuario = usersRepo.findByEmail(email)

        if (!passEncoder.matches(password, usuario!!.password)) ExceptionUtils.PasswordException("La contraseña no coincide")


        return UserDTO(
            token = jWTService.generateToken(usuario.id, usuario.nombre, usuario.apellidos, usuario.email, usuario.nacimiento.toString(), usuario.rol),
            id = usuario.id,
            nombre = usuario.nombre,
            apellido = usuario.apellidos,
            email = usuario.email,
            nacimiento = usuario.nacimiento.toString().sanitizeDate(),
            rol = usuario.rol,
        )
    }

    fun create(nombre: String?, email: String?,  password: String?,  nacimiento: Date?,  rol: String? ): UserDTO? {

        val user = UserModel(
            id = null ,
            nombre = nombre!!,
            apellidos =null,
            email = email!!,
            password = passEncoder.encode(password),
            nacimiento = nacimiento!!,
            rol = rol!!
        )
        utils.checkUserData(user, false)
        val users = usersRepo.save(user)

        return UserDTO(
            token = jWTService.generateToken(user.id,user.nombre, user.apellidos, user.email, user.nacimiento.toString(), user.rol),
            id = users.email,
            nombre = users.nombre,
            apellido = users.apellidos,
            email = users.email,
            nacimiento = users.nacimiento.toString().sanitizeDate(),
            rol = users.rol
        )
    }

    fun getUserByTocken(token: String): UserDTO? {
        val validate: Claims = jWTService.validateTocken(token)
        return UserDTO(
            "",
            validate["id"].toString(),
            validate["nombre"].toString(),
            validate["apellidos"].toString(),
            validate["email"].toString(),
            validate["nacimiento"].toString().sanitizeDate(),
            validate["rol"].toString(),
        )
    }

    fun isExistUserName(name: String): Boolean = usersRepo.existsByNombre(name)
    fun findUserEmail(email: String): Boolean = usersRepo.existsByEmail(email)




}