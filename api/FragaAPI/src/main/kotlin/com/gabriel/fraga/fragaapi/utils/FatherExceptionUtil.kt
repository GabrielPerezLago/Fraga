package com.gabriel.fraga.fragaapi.utils

import org.springframework.http.HttpStatus
import org.springframework.web.server.ResponseStatusException

open class FatherExceptionUtil {

    protected open fun sendBadRequestException(type: String, error: String) {
        throw ResponseStatusException(HttpStatus.BAD_REQUEST,"$type Error: $error")
    }

    protected open fun sendInsertException(type: String, error: String) {
        throw ResponseStatusException(HttpStatus.NOT_IMPLEMENTED,"$type Error: $error")
    }

}