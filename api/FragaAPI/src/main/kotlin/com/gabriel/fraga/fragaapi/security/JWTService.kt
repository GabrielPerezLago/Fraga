package com.gabriel.fraga.fragaapi.security

import io.jsonwebtoken.Claims
import io.jsonwebtoken.Jwts
import io.jsonwebtoken.SignatureAlgorithm
import io.jsonwebtoken.security.Keys
import org.springframework.stereotype.Service
import java.util.Date
import javax.crypto.SecretKey

@Service
class JWTService {
    private val key: SecretKey = Keys.hmacShaKeyFor("Gabriel_Perez_Lago_DEV_FRAGA_API_ACTIVIDADES_AIRE_LIBRE".toByteArray())

    private val expireTime = 1000 * 60 * 60 * 2

    fun generateToken(id: String?, nombre: String, apellidos: String? ="Algo", email: String, nacimiento: String?, rol:String): String {
        val now = Date()
        val expiryDate = Date(now.time + expireTime)

        return Jwts.builder()
            .setSubject(email)
            .claim("id", id)
            .claim("nombre", nombre)
            .claim("apellidos", apellidos)
            .claim("email", email)
            .claim("nacimiento", nacimiento)
            .claim("rol", rol)
            .setIssuedAt(now)
            .setExpiration(expiryDate)
            .signWith(key, SignatureAlgorithm.HS256)
            .compact()
    }

    fun validateTocken(token: String): Claims {
        return Jwts.parserBuilder()
            .setSigningKey(key)
            .build()
            .parseClaimsJws(token)
            .body
    }
}