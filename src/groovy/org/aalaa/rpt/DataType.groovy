/**
 * @Created_By : AALAA
 * @Date       : 2018.07.28 02:31:11 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.rpt

enum DataType {

    STRING          ("String"),
    CSV             ("CSV / Tags"),

    DATE            ("Date"),
    TIME            ("Time"),
    DATE_TIME       ("Date & Time"),
    YEAR            ("Year"),

    //It could be Number. Floating points could manage from params details.
    INTEGER         ("Integer"),
    LONG            ("Long"),
    BIG_DECIMAL     ("BigDecimal"),
    FLOAT           ("Float"),
    DOUBLE          ("Double"),

    BOOLEAN         ("Boolean"),
    CHECKBOX        ("Checkbox"),
    RADIO           ("Radio"),

    //It Could be Collection
    OBJECT          ("Object"),
    LIST            ("List"),
    SET             ("Set"),
    MAP             ("Map"),

    final String value

    DataType(String value) {
        this.value = value
    }

    String getKey() { name() }

    @Override
    String toString() {
        return value
    }
}
