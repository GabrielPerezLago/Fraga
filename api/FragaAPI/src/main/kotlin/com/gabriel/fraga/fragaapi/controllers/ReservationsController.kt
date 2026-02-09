package com.gabriel.fraga.fragaapi.controllers

import com.gabriel.fraga.fragaapi.models.ReservationsModel
import com.gabriel.fraga.fragaapi.services.ReservationsService
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/reservas")
@CrossOrigin(origins = ["*"])
class ReservationsController(private val service: ReservationsService) {
    @GetMapping("")
    fun findByAll(): List<ReservationsModel> = service.findByAll()
}