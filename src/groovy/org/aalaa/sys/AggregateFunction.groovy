/**
 * @Created_By : AALAA
 * @Date       : 2021.11.27 08:27:11 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

enum AggregateFunction {

   COUNT ("Count"),
   SUM   ("Sum"  ),
   AVG   ("Avg"  ),
   MIN   ("Min"  ),
   MAX   ("Max"  ),

    final String value

    AggregateFunction(String value) {
        this.value = value
    }

    String getKey() { name() }

    @Override
    String toString() {
        return value
    }
}
