package org.aalaa.hr

import org.aalaa.auth.AuthUser
import org.aalaa.pb.PbContact

class HrContactEmployee extends PbContact {
    HrEmployee hrEmployee
    AuthUser   authUser

    static constraints = {
        hrEmployee nullable: false

        authUser   nullable: true
    }
}
