package com.gabriel.fraga.fragaapi.services

import com.gabriel.fraga.fragaapi.models.ActivityModel
import com.gabriel.fraga.fragaapi.repositories.ActivitiesRepository
import org.springframework.stereotype.Service

@Service
class ActivitiesService(private val repo: ActivitiesRepository) {
    fun findByAll() : List<ActivityModel>{
        return repo.findAll()
    }
}