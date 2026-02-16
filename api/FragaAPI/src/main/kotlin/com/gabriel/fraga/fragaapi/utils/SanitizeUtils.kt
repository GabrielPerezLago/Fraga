package com.gabriel.fraga.fragaapi.utils

import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

fun String.sanitizeEmail() = replace(Regex("[^a-zA-Z0-9@._+\\-]"), "")
    fun String.sanitezeText() = replace(Regex("\"[^a-zA-Z0-9áéíóúÁÉÍÓÚñÑ ]\""), "")
    fun String.sanitizeDangerous() = replace(Regex("[<>\"'%;()&+]"), "")

    fun String.sanitizeDate(): String? {
        val input = SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH)
        val date = input.parse(this) ?: return null
        val output = SimpleDateFormat("dd/MM/yyyy")
        return output.format(date)
    }
