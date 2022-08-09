/**
 * @Created_By : AALAA
 * @Date       : 2017.02.16 02:01:18 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.com

enum Gender {
    MALE    ("Male"),
    FEMALE  ("Female")

    final String value

    Gender(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}