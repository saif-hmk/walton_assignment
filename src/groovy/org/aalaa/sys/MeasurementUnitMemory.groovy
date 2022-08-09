/**
 * @Created_By : AALAA
 * @Date       : 2018.06.19 11:05:18 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

enum MeasurementUnitMemory {
    BYTES       ("Bytes"),
    KILO_BYTES  ("Kilo Bytes"),
    MEGA_BYTES  ("Mega Bytes"),
    GIGA_BYTES  ("Giga Bytes"),
    TERA_BYTES  ("Tera Bytes"),
    PETA_BYTES  ("Peta Bytes"),
    EXA_BYTES   ("Exa Bytes"),
    ZETTA_BYTES ("Zetta Bytes"),
    YOTTA_BYTES ("Yotta Bytes")

    final String value

    MeasurementUnitMemory(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}










