/**
 * @Created_By : AALAA
 * @Date       : 2022.05.05 01:09:31 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.nm.com

class NmLog {

    String typeNm,
           content,
           contentCategory
    Date   logCreatedAt = new Date()

    static mapping = {
        table  'a_nm_log'
    }

    static constraints = {
        logCreatedAt    nullable: false
        typeNm          nullable: false, display: false
        contentCategory nullable: false, size   : 1..100
        content         nullable: false, size   : 1..4000
    }

    @Override
    String toString() {
        return content
    }
}
