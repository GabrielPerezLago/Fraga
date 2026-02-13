package com.gabriel.fraga.fragaapi.repositories

import com.gabriel.fraga.fragaapi.models.UserModel
import org.springframework.data.mongodb.repository.MongoRepository
import org.springframework.stereotype.Repository

@Repository
interface UsersRepository: MongoRepository<UserModel, String> {
    fun findByEmailAndPassword(email: String?, password: String?): UserModel?
    fun findByEmail(email: String?): UserModel?
    fun findByUsername(username: String?): UserModel?
    fun existsByNombre(nombre: String): Boolean
    fun existsByEmail(email: String): Boolean

}