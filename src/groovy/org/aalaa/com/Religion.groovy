/**
 * @Created_By : AALAA
 * @Date       : 2016.12.16 11:01:18 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.com

enum Religion {
    ISLAM    ("Islam"),
    HINDU    ("Hindu"),
    CHRISTIAN("Christian"),
    BUDDAH   ("Buddah")

    final String value

    Religion(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}