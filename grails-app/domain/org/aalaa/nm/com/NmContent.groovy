/**
 * @Created_By : AALAA
 * @Date       : 2022.05.05 01:09:31 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.nm.com

import org.aalaa.auth.AuthUser
import org.aalaa.nm.StatusNm
import org.aalaa.adm.AdmContentCategory
/**
 * @category: EID-PUJA-CHRISTMAS WISHES,
 *  BIRTH-DEATH-MARRIAGE-WEDDING ANNIVERSARY,
 *  CORONA-DENGUE-HARTAL AWARENESS,
 *  SALARY-BONUS-PROMOTION-INCREMENT-DECREMENT NOTICE,
 *  CLIENT-PROJECT MEETING, BILL_COLLECTION,
 *  PROJECT-INAUGURATION-CEREMONY DAY
 *  SMS_BALANCE-PATTY_CASH-LOAN-DUE-INTEREST,UN_DEPOSITED_CASH WARNING
 * @type: SMS, EMAIL, MESSAGE
 * @statusEntry: SYSTEM_GENERATED, MANUAL_ENTRY, EXCEL_UPLOAD, API
 * @status: PENDING, EXPIRED, HOLD, CANCELLED, FAILED: {INSUFFICIENT_BALANCE, INVALID_IDENTITY, SYSTEM_ERROR}
 **/
class NmContent {
    AuthUser           logCreatedBy,
                       logModifiedBy
    AdmContentCategory category
    StatusNm           status          = StatusNm.PENDING

    String             type,
                       title,
                       content,
                       statusEntry     = "SYSTEM_GENERATED"
    Boolean            active          = true
    Date               activeFrom      = new Date(),
                       activeTo,
                       logCreatedDate  = new Date(),
                       logModifiedDate

    static mapping = {
        table  'A_NM_CONTENT'
        //content   sqlType: "mediumText"
        active    column: "is_active"
    }

    static constraints = {
        content         nullable: false
        category        nullable: false
        status          nullable: false
        statusEntry     nullable: false
        active          nullable: false
        activeFrom      nullable: false
        title           nullable: false
        type            nullable: false, display: false
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
