package com.gabriel.fraga.fragaapi.utils

    fun String.sanitizeEmail() = replace(Regex("[^a-zA-Z0-9@._+\\-]"), "")
    fun String.sanitezeText() = replace(Regex("\"[^a-zA-Z0-9áéíóúÁÉÍÓÚñÑ ]\""), "")
    fun String.sanitizeDangerous() = replace(Regex("[<>\"'%;()&+]"), "")
