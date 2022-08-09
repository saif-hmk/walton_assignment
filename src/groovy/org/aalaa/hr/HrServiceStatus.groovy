/**
 * @Created_By : AALAA
 * @Date : 2017.09.11 02:01:18 AM
 * @Author : Md. Hoshen Mahmud Khan
 * @Email : saif_hmk@live.com
 * @Phone : +8801672036757
 * */

package org.aalaa.hr

enum HrServiceStatus {
    WORKING("Working"),
    OSD("OSD"),
    RESIGNED("Resigned"),
    FIRED("Fired"),
    LPR("LPR"),
    RETIRED("Retired"),

    final String value

    HrServiceStatus(String value) {
        this.value = value
    }

    String getKey() { name() }

    @Override
    String toString() {
        return value
    }
}
