/**
 * @Created_By : AALAA
 * @Date       : 2018.02.28 01:59:12 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

enum FormatDateLong {
    MMMM_D_YYYY     ("MMMM d, yyyy"      ),
    D_MMMM_YYYY     ("d MMMM, yyyy"      ),
    DDDD_MMMM_D_YYYY("dddd, MMMM d, yyyy"),
    DDDD_D_MMMM_YYYY("dddd, d MMMM, yyyy")


    final String value

    FormatDateLong(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}
