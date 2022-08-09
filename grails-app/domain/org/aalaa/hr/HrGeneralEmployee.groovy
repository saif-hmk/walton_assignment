/**
 * @Created_By : AALAA
 * @Date       : 2022.05.01 12:02:32 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.hr

class HrGeneralEmployee extends HrEmployee {

    HrEmployeeType employeeType = HrEmployeeType.EMPLOYEE

    String         nameFirst,
                   nameMiddle,
                   nameLastSur,
                   nameFirstNative,
                   nameMiddleNative,
                   nameLastSurNative,
                   passportNo,
                   nameSpouse,
                   nameSpouseNative
    Integer        familyMemberTotal,
                   familyMemberDependent

    Date           passportExpireDate

    static constraints = {
        nameFirst             nullable: true
        nameFirstNative       nullable: true

        nameMiddle            nullable: true
        nameLastSur           nullable: true
        nameMiddleNative      nullable: true
        nameLastSurNative     nullable: true
        passportNo            nullable: true
        passportExpireDate    nullable: true
        nameSpouse            nullable: true
        nameSpouseNative      nullable: true
        familyMemberTotal     nullable: true
        familyMemberDependent nullable: true
    }
}
