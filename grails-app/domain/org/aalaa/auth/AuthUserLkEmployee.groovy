package org.aalaa.auth

import org.aalaa.hr.HrEmployee
import org.aalaa.hr.HrGeneralEmployee

class AuthUserLkEmployee {

    AuthUser   authUser
    HrEmployee hrEmployee

    String     userName,
               employeeName
    //Integer    sortOrder = 1
    Boolean    isActive  = true

    static mapping = {
        version false
        table 'A_AUTH_USER_LK_EMPLOYEE'
    }

    static constraints = {
        isActive     nullable: false
        authUser     nullable: false
        hrEmployee   nullable: false, unique: true//, unique: ["authUser"]
        //sortOrder    nullable: false

        userName     nullable: true, blank: true
        employeeName nullable: true, blank: true
    }

    AuthUserLkEmployee(){}

    AuthUserLkEmployee(AuthUser authUser, HrGeneralEmployee hrEmployee) {
        this.authUser   = authUser
        this.hrEmployee = hrEmployee
    }

    @Override
    String toString() {
        return hrEmployee
    }

    String toMap() {
        return [authUser: authUser, hrEmployee: hrEmployee]
    }
}
