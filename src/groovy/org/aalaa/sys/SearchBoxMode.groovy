/**
 * @Created_By : AALAA
 * @Date       : 2018.02.28 03:01:11 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

enum SearchBoxMode {
    TOP     ("Top" ),
    LEFT    ("Left")

    final String value

    SearchBoxMode(String value) {
        this.value = value
    }

    String getKey() { name() }

    @Override
    String toString() {
        return value
    }
}
