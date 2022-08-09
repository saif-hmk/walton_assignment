/**
 * @Created_By : AALAA
 * @Date       : 2022.05.05 01:09:31 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.nm.com

import org.aalaa.auth.AuthUser
import org.aalaa.com.ComLookup

/**
 * @category: EID-PUJA-CHRISTMAS WISHES,
 *  BIRTH-DEATH-MARRIAGE-WEDDING ANNIVERSARY,
 *  CORONA-DENGUE-HARTAL AWARENESS,
 *  SALARY-BONUS-PROMOTION-INCREMENT-DECREMENT NOTICE,
 *  CLIENT-PROJECT MEETING, BILL_COLLECTION,
 *  PROJECT-INAUGURATION-CEREMONY DAY
 *  SMS_BALANCE-PATTY_CASH-LOAN-DUE-INTEREST,UN_DEPOSITED_CASH WARNING
 *
 **/
class NmTemplate {
    AuthUser logCreatedBy,
             logModifiedBy
    ComLookup category

    String  typeOfTemplate,
            content
    Boolean active         = true
    Date    activeFrom     = new Date(),
            activeTo,
            logCreatedDate = new Date(),
            logModifiedDate

    static mapping = {
        table  'a_nm_template'
        //content   sqlType: "clob"
        //content   sqlType: "mediumText"
        active    column: "IS_ACTIVE"
    }

    static constraints = {
        content         nullable: false
        activeFrom      nullable: false
        category        nullable: false
        active          nullable: false
        typeOfTemplate  nullable: false, display: false
        logCreatedBy    nullable: false, display: false
        logCreatedDate  nullable: false, display: false

        activeTo        nullable: true
        logModifiedBy   nullable: true, display: false
        logModifiedDate nullable: true, display: false
    }

    @Override
    String toString() {
        return content
    }
}
