/**
 * @Created_By : AALAA
 * @Date       : 2020.02.17 12:21:11 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

enum QueryType {
    CSV          ("CSV"                                 ),
    JSON         ("JSON"                                ),
    HQL          ("Hibernate Query"                     ),
    SQL          ("Structured Query"                    ),

    final String value

    QueryType(String value) {
        this.value = value
    }

    String getKey() { name() }

    @Override
    String toString() {
        return value
    }
}