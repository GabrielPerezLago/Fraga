package com.gabriel.fraga.fragaapi.controllers

import com.gabriel.fraga.fragaapi.models.ActivityModel
import com.gabriel.fraga.fragaapi.services.ActivitiesService
import org.bson.types.ObjectId
import org.springframework.web.bind.annotation.CrossOrigin
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
    fun findByUser(id: String): List<ActivityModel> {
        val objId = ObjectId(id)
        return service.findResByUser(objId)
    }

    @PostMapping("/find-all-user")
    fun findAllUser(id: String): List<ActivityModel> {
        val objId = ObjectId(id)
        return service.findOnlyNoReserveActivities(objId)
    }
}