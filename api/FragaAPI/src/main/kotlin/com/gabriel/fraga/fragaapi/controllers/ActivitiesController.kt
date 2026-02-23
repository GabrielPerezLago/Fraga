package com.gabriel.fraga.fragaapi.controllers

import com.gabriel.fraga.fragaapi.models.ActivityDTO
import com.gabriel.fraga.fragaapi.models.ActivityModel
import com.gabriel.fraga.fragaapi.models.ReservationsModel
import com.gabriel.fraga.fragaapi.services.ActivitiesService
import org.bson.types.ObjectId
import org.springframework.data.mongodb.core.aggregation.MergeOperation.UniqueMergeId.id
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController
import java.util.Optional


@RestController
@RequestMapping("/actividades")
@CrossOrigin(origins = ["*"])
class ActivitiesController(private val service: ActivitiesService) {

    @GetMapping("")
    fun findByAll(): List<ActivityModel> {
        return service.findByAll()
    }

    @PostMapping("/find-id")
    fun findById(@RequestParam id: String): ActivityModel = service.findById(id) as ActivityModel

    @PostMapping("find-user")
    fun findByUser(id: String): List<ActivityDTO> {
        val objId = ObjectId(id)
        return service.findResByUser(objId)
    }

    @PostMapping("/find-all-user")
    fun findAllUser(id: String): List<ActivityModel> {
        val objId = ObjectId(id)
        return service.findOnlyNoReserveActivities(objId)
    }

    @PostMapping("/create-reserva")
    fun findCreateReserva(idUser: String, idActivity: String): Boolean {
        val objIdUser = ObjectId(idUser)
        val objIdActivity = ObjectId(idActivity)

        return service.cretateReserva(objIdUser, objIdActivity)
    }

    @PostMapping("/cancelar")
    fun cancelar(idUser: String, idActivity: String): Boolean {
        val objIdUser = ObjectId(idUser)
        val objIdActivity = ObjectId(idActivity)
        return service.updateReservaActivity(objIdUser, objIdActivity)
    }

    @DeleteMapping("/delete")
    fun deleteById(@RequestParam id: String) {
        return service.deleteActivity(id)
    }

    @PostMapping("/create")
    fun createActivity(
        @RequestParam nombre: String,
        @RequestParam descripcion: String,
        @RequestParam fecha: String,
        @RequestParam plazas: String,
        @RequestParam images: String,
    ): ActivityModel {
        return service.createActivity(nombre, descripcion, fecha, plazas.toInt(), images)
    }
}