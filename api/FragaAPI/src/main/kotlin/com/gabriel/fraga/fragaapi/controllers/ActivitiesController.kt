package com.gabriel.fraga.fragaapi.controllers

import com.gabriel.fraga.fragaapi.models.ActivityModel
import com.gabriel.fraga.fragaapi.services.ActivitiesService
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController


@RestController
@RequestMapping("/actividades")
@CrossOrigin(origins = ["*"])
class ActivitiesController(private val service: ActivitiesService) {

    @GetMapping("")
    fun findByAll(): List<ActivityModel> {
        return service.findByAll()
    }
}