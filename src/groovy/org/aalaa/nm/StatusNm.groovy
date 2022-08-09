/**
 * @Created_By : AALAA
 * @Date : 2020.05.29 09:25:10 PM
 * @Author : Md. Hoshen Mahmud Khan
 * @Email : saif_hmk@live.com
 * @Phone : +8801672036757
 * */

package org.aalaa.nm

enum StatusNm {

    PENDING("Pending", 5),
    HOLD("Hold", 10),
    EXPIRED("Expired", 15),
    FAILED("Failed", 20),
    REJECTED("Rejected", 25),
    SUCCESS("Success", 30),

    final String value
    final Integer sortOrder

    StatusNm(String value) {
        this.value = value
    }

    StatusNm(Integer sortOrder) {
        this.sortOrder = sortOrder
    }

    StatusNm(String value, Integer sortOrder) {
        this.value = value
        this.sortOrder = sortOrder
    }

    String getKey() { name() }

    @Override
    String toString() {
        return value
    }
}
