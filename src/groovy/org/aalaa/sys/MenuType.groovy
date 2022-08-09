/**
 * @Created_By : AALAA
 * @Date       : 2017.05.16 12:01:18 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

enum MenuType {
    NONE     ("NONE"),
    LEFT     ("LEFT"),
    TOP_TREE ("TOP_TREE"),
    TOP_MEGA ("TOP_MEGA")

    final String value

    MenuType(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}
