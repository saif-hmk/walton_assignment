/**
 * @Created_By : AALAA
 * @Date       : 2021.10.31 09:29:14 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.acc

enum CurrencyType {
    REGULAR        ("Regular"       ),
    HISTORICAL     ("Historical"    ),
    DIGITAL_CRYPTO ("Digital Crypto"),

    final String value

    CurrencyType(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}
