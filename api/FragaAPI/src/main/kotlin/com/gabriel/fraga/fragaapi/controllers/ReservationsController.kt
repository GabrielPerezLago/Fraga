package com.gabriel.fraga.fragaapi.controllers

import com.gabriel.fraga.fragaapi.models.ReservationsDTO
import com.gabriel.fraga.fragaapi.models.ReservationsModel
import com.gabriel.fraga.fragaapi.services.ReservationsService
import org.bson.types.ObjectId
import org.springframework.data.repository.query.Param
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/reservas")
@CrossOrigin(origins = ["*"])
class ReservationsController(private val service: ReservationsService) {
    @GetMapping("")
    fun findByAll(): List<ReservationsModel> = service.findByAll()

    @PostMapping("/find")
    fun findById(@RequestParam id: String): ReservationsModel? = service.findById(id)

    @PostMapping("/finduser")
    fun findByUserId(@RequestParam id: String): List<ReservationsDTO>  {
        val objId = ObjectId(id)
        return service.findByUserId(objId)
    }


}