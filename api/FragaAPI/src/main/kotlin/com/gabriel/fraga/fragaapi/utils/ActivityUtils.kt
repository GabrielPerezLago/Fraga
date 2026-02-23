package com.gabriel.fraga.fragaapi.utils

import java.time.LocalDateTime

class ActivityUtils {

    fun isAfterMinutes(time : LocalDateTime): Boolean {
        val hoy = LocalDateTime.now()
        return hoy.isAfter(time.minusMinutes(15))
    }

    fun isAfterToday(time : LocalDateTime): Boolean {
        val hoy = LocalDateTime.now()
        return hoy.isAfter(time.plusDays(1))
    }
}