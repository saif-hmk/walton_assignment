/**
 * @Created_By : AALAA
 * @Date       : 2021.11.27 08:06:11 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

import org.aalaa.auth.AuthRole

class SysDashboardItemLkRole implements Serializable {

    private static final long serialVersionUID = 1

    SysDashboardItem sysDashboardItem
    AuthRole         authRole

    static mapping = {
        version true
        table   'A_SYS_DASHBOARD_ITEM_LK_ROLE'

        //id generator: 'sequence', params: [sequence: 'S_A_SYS_DASHBOARD_ITEM_LK_ROLE']
    }

    static constraints = {
        sysDashboardItem nullable: false
        authRole         nullable: false, display: false
    }

    @Override
    String toString() {
        return sysDashboardItem + " - " + authRole
    }
}
