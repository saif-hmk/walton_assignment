/**
 * @Created_By : AALAA
 * @Date       : 2021.11.27 07:51:10 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

import org.aalaa.auth.AuthUser

class SysDashboardItem implements Serializable {

    private static final long serialVersionUID = 1

    AuthUser                   logCreatedBy,
                               logModifiedBy
    SysDashboardComponentGroup componentGroup
    SysScript                  sysScript

    String                     code,
                               componentType,
                               title,
                               titleNative,
                               titlePosition = "bottom",
                               chartType     = "bar",
                               chartDsLabel,
                               classBody,
                               classFooter,
                               classIcon,
                               classText,
                               detailsUrl,
                               mediaClass,
                               canvasId,
                               remarks
    Integer                    sortOrder,
                               canvasHeight,
                               canvasWidth
    Boolean                    active         = true,
                               showTitle
    Date                       logCreatedDate = new Date(),
                               logModifiedDate

    static mapping = {
        version true
        table   'A_SYS_DASHBOARD_ITEM'

        sort id: 'desc'
        //id generator: 'sequence', params: [sequence: 'S_A_SYS_DASHBOARD_ITEM']
        active column: "IS_ACTIVE"
    }

    static constraints = {
        active          nullable: false
        componentGroup  nullable: false
        sysScript       nullable: false
        componentType   nullable: false
        sortOrder       nullable: false
        title           nullable: false, size: 1..50
        titleNative     nullable: false, size: 1..100
        code            nullable: false, size: 1..30, unique: true
        logCreatedBy    nullable: false, display: false
        logCreatedDate  nullable: false, display: false

        classBody       nullable: true
        classFooter     nullable: true
        classIcon       nullable: true
        classText       nullable: true
        detailsUrl      nullable: true
        titlePosition   nullable: true
        chartType       nullable: true
        chartDsLabel    nullable: true
        showTitle       nullable: true
        mediaClass      nullable: true
        canvasId        nullable: true
        canvasHeight    nullable: true
        canvasWidth     nullable: true
        remarks         nullable: true, blank  : true, size: 0..255
        logModifiedBy   nullable: true, display: false
        logModifiedDate nullable: true, display: false
    }

    @Override
    String toString() {
        return title
    }
}
