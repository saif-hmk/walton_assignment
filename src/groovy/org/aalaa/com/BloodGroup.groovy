/**
 * @Created_By : AALAA
 * @Date       : 2017.02.06 01:02:32 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.com

enum BloodGroup {
    A_POSITIVE  ("A+"),
    A_NEGATIVE  ("A-"),
    B_POSITIVE  ("B+"),
    B_NEGATIVE  ("B-"),
    AB_POSITIVE ("AB+"),
    AB_NEGATIVE ("AB-"),
    O_POSITIVE  ("O+"),
    O_NEGATIVE  ("O-")

    final String value

    BloodGroup(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}