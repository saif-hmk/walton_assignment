/**
 * @Created_By : AALAA
 * @Date       : 2018.02.28 02:09:13 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

enum FormatDateShort {
    M_D_YYYY   ("M/d/yyyy"  ),
    M_D_YY     ("M/d/yy"    ),
    MM_DD_YY   ("MM/dd/yy"  ),
    MM_DD_YYYY ("MM/dd/yyyy"),
    YY_MM_DD   ("yy/MM/dd"  ),
    YYYY_MM_DD ("yyyy/MM/dd"),
    DD_MMMM_YY ("dd-MMMM-yy")

    final String value

    FormatDateShort(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}
