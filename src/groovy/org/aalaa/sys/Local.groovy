/**
 * @Created_By : AALAA
 * @Date       : 2017.08.16 02:09:11 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

enum Local {
    BN ("bn"),
    EN ("en")

    final String value

    Local(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}
