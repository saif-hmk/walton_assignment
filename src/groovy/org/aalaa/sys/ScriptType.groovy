/**
 * @Created_By : AALAA
 * @Date       : 2021.05.08 02:08:11 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

enum ScriptType {

    JS  ("Java Script"     ),
    HQL ("Hibernate Query" ),
    SQL ("Structured Query"),

    final String value

    ScriptType(String value) {
        this.value = value
    }

    String getKey() { name() }

    @Override
    String toString() {
        return value
    }
}
