/**
 * @Created_By : AALAA
 * @Date       : 2022.03.03 12:21:11 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.rpt

enum ReceiveValueFrom {
    FRONT_END ("Front End"),
    BACK_END  ("Back End" )

    final String value

    ReceiveValueFrom(String value) {
        this.value = value
    }

    String getKey() { name() }

    @Override
    String toString() {
        return value
    }
}