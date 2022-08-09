/**
 * @Created_By : AALAA
 * @Date       : 2022.06.30 11:06:32 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.hr

import org.aalaa.adm.AdmBranch
import org.aalaa.adm.AdmDepartment
import org.aalaa.adm.AdmDesignation
import org.aalaa.adm.AdmOrganization
import org.aalaa.auth.AuthUser
import org.aalaa.com.*
import org.aalaa.loc.LocDistrict
import org.aalaa.loc.LocDivision
import org.aalaa.loc.LocSubDistrict
import org.aalaa.loc.LocUnionCouncil

abstract class HrEmployee {
    AuthUser         logCreatedBy,
                     logModifiedBy
    LocDivision      locPermanentDivision,
                     locPresentDivision
    LocDistrict      locPermanentDistrict,
                     locPresentDistrict
    LocSubDistrict   locPermanentSubDistrict,
                     locPresentSubDistrict
    LocUnionCouncil  locPermanentUnionCouncil,
                     locPresentUnionCouncil
    AdmOrganization  admVendorOrganization
    AdmBranch        admBranch
    AdmDepartment    department,
                     departmentJoining
    AdmDesignation   designation,
                     designationJoining
    BloodGroup       bloodGroup
    Relation         emergencyContactRelation
    Gender           gender         = Gender.MALE
    Honorific        honorific      = Honorific.MR
    MaritalStatus    maritalStatus  = MaritalStatus.SINGLE
    Religion         religion       = Religion.ISLAM
    HrEmployeeType   employeeType
    HrEmploymentType employmentType = HrEmploymentType.PERMANENT
    HrServiceStatus  serviceStatus  = HrServiceStatus.WORKING

    String           code,
                     nameFull,
                     nameFullNative,
                     mobileNoPrimary,
                     mobileNoSecondary,
                     email,
                     nid,
                     bid,
                     nameFather,
                     nameMother,
                     nameNativeFather,
                     nameNativeMother,
                     locPermanentAddress,
                     locPresentAddress,
                     emergencyContactNo,
                     emergencyContactPerson
    Float            grossSalary,
                     grossSalaryJoining
    Date             dateOfBirth,
                     dateOfDeath,
                     dateOfServiceEnd,
                     dateOfServiceStart = new Date(),
                     logCreatedDate     = new Date(),
                     logModifiedDate

    /*
    * TODO ADD : hasMany items
    * @domain:
    *
    * static hasMany = [
    *   hcmContactDetails       : HcmContactDetails,        //socialMediaInfo, 
    *   admPropertyAssignment   : AdmPropertyAssignment,    //
    *
    *   personalInfo            : PersonalInfo,
    *   nomineeInfo             : NomineeInfo,
    *   healthInfo              : HealthInfo,               //eg: diseases, major issues
    *   educationalInfo         : EducationalInfo,
    *   extraCurricularInfo     : ExtraCurricularInfo,
    *   jobInfo                 : JobInfo,                  //including SalaryInfo
    *   leaveVaultInfo          : LeaveVaultInfo,
    *   leaveUtilizationInfo    : LeaveUtilizationInfo,
    *   familyMemberInfo        : FamilyMemberInfo,         //eg: father, mother, brother for imergency contact
    *   previousEmploymentInfo  : PreviousEmploymentInfo,
    *   investmentInfo          : InvestmentInfo,           //eg: Laptop, Training, Car, Food, Flat, ProvidentFund etc. > {Type: Returnable, CONSUMABLE}
    * ]
    *
    **/

    static mapping = {
        table  'A_HR_EMPLOYEE'
    }

    static constraints = {
        locPermanentDivision     nullable: false
        locPresentDivision       nullable: false
        locPermanentDistrict     nullable: false
        locPresentDistrict       nullable: false
        locPermanentSubDistrict  nullable: false
        locPresentSubDistrict    nullable: false
        admVendorOrganization    nullable: false
        department               nullable: false
        designation              nullable: false
        gender                   nullable: false
        honorific                nullable: false
        maritalStatus            nullable: false
        religion                 nullable: false
        employeeType             nullable: false
        employmentType           nullable: false
        serviceStatus            nullable: false
        code                     nullable: false
        nameFull                 nullable: false
        nameFullNative           nullable: true
        mobileNoPrimary          nullable: false
        nameFather               nullable: false
        nameMother               nullable: false
        nameNativeFather         nullable: true
        nameNativeMother         nullable: true
        locPermanentAddress      nullable: false
        locPresentAddress        nullable: false
        admBranch                nullable: true
        dateOfBirth              nullable: true
        dateOfServiceStart       nullable: false
        logCreatedBy             nullable: false, display: false
        logCreatedDate           nullable: false, display: false

        locPermanentUnionCouncil nullable: true
        locPresentUnionCouncil   nullable: true
        departmentJoining        nullable: true
        designationJoining       nullable: true
        bloodGroup               nullable: true
        mobileNoSecondary        nullable: true
        email                    nullable: true
        nid                      nullable: true
        bid                      nullable: true
        grossSalary              nullable: true
        grossSalaryJoining       nullable: true
        dateOfDeath              nullable: true
        dateOfServiceEnd         nullable: true
        emergencyContactNo       nullable: true
        emergencyContactPerson   nullable: true
        emergencyContactRelation nullable: true
        logModifiedBy            nullable: true, display: false
        logModifiedDate          nullable: true, display: false
    }

    @Override
    String toString() {
        return nameFull
    }
}
