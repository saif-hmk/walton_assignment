/**
 * @Created_By : AALAA
 * @Date       : 2017.08.15 02:01:18 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.auth

enum Availability {
    AWAY      ("Away"),
    BUSY      ("Busy"),
    INVISIBLE ("Invisible"),
    LEAVE     ("Leave"),
    ONLINE    ("Online"),

    final String value

    Availability(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}
