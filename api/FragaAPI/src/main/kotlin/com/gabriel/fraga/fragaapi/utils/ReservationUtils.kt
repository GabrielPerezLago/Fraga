package com.gabriel.fraga.fragaapi.utils

import com.gabriel.fraga.fragaapi.models.ReservationsDTO
import com.gabriel.fraga.fragaapi.models.ReservationsModel

class ReservationUtils {

    fun parseIdsToStrings(model: ReservationsModel): ReservationsDTO {
        return ReservationsDTO(
            model.id,
            model.idUser.toString(),
            model.idActivity.toString(),
            model.realizada
        )
    }

    fun parseListIdToStrings(mode: List<ReservationsModel>): List<ReservationsDTO> {
        var res = ArrayList<ReservationsDTO>()

        for (m in mode) {
            res.add(parseIdsToStrings(m))
        }

        return res
    }
}