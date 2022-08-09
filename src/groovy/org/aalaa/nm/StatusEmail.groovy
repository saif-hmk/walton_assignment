/**
 * @Created_By : AALAA
 * @Date : 2020.05.29 07:58:10 PM
 * @Author : Md. Hoshen Mahmud Khan
 * @Email : saif_hmk@live.com
 * @Phone : +8801672036757
 * */

package org.aalaa.nm

enum StatusEmail {
    PENDING("Pending"),
    SENT("Sent"),
    FAILED("Failed"),

    final String value

    StatusEmail(String value) {
        this.value = value
    }

    String getKey() { name() }

    @Override
    String toString() {
        return value
    }
}
