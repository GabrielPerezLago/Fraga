package com.gabriel.fraga.fragaapi.repositories

import com.gabriel.fraga.fragaapi.models.ActivityModel
import org.springframework.data.mongodb.repository.MongoRepository
import org.springframework.stereotype.Repository

@Repository
interface ActivitiesRepository: MongoRepository<ActivityModel, String> {
}