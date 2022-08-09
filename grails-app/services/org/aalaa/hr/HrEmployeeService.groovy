package org.aalaa.hr

import grails.transaction.Transactional
import org.aalaa.auth.AuthUser
import org.aalaa.auth.AuthUserLkEmployee

@Transactional
class HrEmployeeService {

    List<AuthUser> getUserList(List<HrGeneralEmployee> employeeList) {
        List<AuthUserLkEmployee> authUserLkEmployeeList = AuthUserLkEmployee.findAllByHrEmployeeInList(employeeList)
        return authUserLkEmployeeList?.authUser
    }
}
