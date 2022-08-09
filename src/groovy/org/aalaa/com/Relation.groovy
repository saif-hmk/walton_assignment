/**
 * @Created_By : AALAA
 * @Date       : 2017.02.13 12:01:18 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.com

enum Relation {
    FATHER          ("Father"),
    MOTHER          ("Mother"),
    BROTHER         ("Brother"),
    SISTER          ("Sister"),
    GRAND_FATHER    ("Grand Father"),
    GRAND_MOTHER    ("Grand Mother"),
    UNCLE           ("Uncle"),
    AUNT            ("Aunt")

    final String value

    Relation(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}