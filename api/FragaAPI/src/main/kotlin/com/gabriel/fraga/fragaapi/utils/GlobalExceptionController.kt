package com.gabriel.fraga.fragaapi.utils

import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.server.ResponseStatusException
import java.time.Instant

@ControllerAdvice
class GlobalExceptionController {

    @ExceptionHandler(ResponseStatusException::class)
    fun handleResponseStatus(rex: ResponseStatusException) : ResponseEntity<Map<String, String>> {
        val body = mapOf(
            "timestamp" to Instant.now().toString(),
            "status" to rex.statusCode.value().toString(),
            "error" to (rex.reason ?: "")
        )
        return ResponseEntity(body, rex.statusCode)
    }
}