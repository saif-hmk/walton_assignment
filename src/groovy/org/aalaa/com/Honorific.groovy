/**
 * @Created_By : AALAA
 * @Date       : 2017.02.16 03:02:13 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.com

enum Honorific {
    LADY    ("Lady"),
    MAAM    ("Ma'am"),
    MADAM   ("Madam"),
    MISS    ("Miss"),
    MR      ("Mr."),
    MRS     ("Mrs."),
    SIR     ("Sir")

    final String value

    Honorific(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}