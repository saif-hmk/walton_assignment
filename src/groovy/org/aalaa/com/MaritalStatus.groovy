/**
 * @Created_By : AALAA
 * @Date       : 2015.08.20 12:01:18 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.com

enum MaritalStatus {
    SINGLE      ("Single"),
    MARRIED     ("Married"),
    SEPARATED   ("Separated"),
    DIVORCED    ("Divorced"),
    WIDOWED     ("Widowed"),
    OTHER       ("Other")

    final String value

    MaritalStatus(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}