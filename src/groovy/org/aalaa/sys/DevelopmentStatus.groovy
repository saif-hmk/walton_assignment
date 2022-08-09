/**
 * @Created_By : AALAA
 * @Date       : 2018.02.28 02:07:11 aM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

enum DevelopmentStatus {
    PENDING ("Pending"),
    WIP     ("Work in Progress"),
    DONE    ("Done")

    final String value

    DevelopmentStatus(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}