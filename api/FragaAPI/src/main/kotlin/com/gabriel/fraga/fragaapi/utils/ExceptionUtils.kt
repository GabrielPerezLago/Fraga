package com.gabriel.fraga.fragaapi.utils

object ExceptionUtils: FatherExceptionUtil(){

    fun CreateException(exception: String) {
        super.sendInsertException("Create" ,exception)
    }
    fun EmailException (exception: String) {
        super.sendBadRequestException("Email", exception )
    }
    fun PasswordException (exception: String) {
        super.sendBadRequestException("Password", exception)
    }

    fun UserNameException (exception: String) {
        super.sendBadRequestException("Username", exception)
    }

    fun DateBornException (exception: String) {
        super.sendBadRequestException("DateBorn", exception)
    }

    fun RolesException (exception: String) {
        super.sendBadRequestException("Roles", exception)
    }

    fun UserIdException (exception: String) {
        super.sendBadRequestException("UserId", exception)
    }


}