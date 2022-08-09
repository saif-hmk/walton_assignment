/**
 * @Created_By : AALAA
 * @Date : 2017.10.14 01:01:18 AM
 * @Author : Md. Hoshen Mahmud Khan
 * @Email : saif_hmk@live.com
 * @Phone : +8801672036757
 * */

package org.aalaa.hr

enum HrEmploymentType {
    PERMANENT("Permanent"),
    PART_TIME("Part Time"),
    GUEST    ("Guest"    ),
    DAILY    ("Daily"    ),
    ON_DEMAND("On-Demand"),

    final String value

    HrEmploymentType(String value) {
        this.value = value
    }

    String getKey() { name() }

    @Override
    String toString() {
        return value
    }
}
