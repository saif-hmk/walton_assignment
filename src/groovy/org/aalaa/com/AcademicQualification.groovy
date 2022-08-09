/**
 * @Created_By : AALAA
 * @Date       : 2017.02.06 03:31:18 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.com

enum AcademicQualification {
    PHD           ("PHD"),
    POST_GRADUATE ("Post Graduate"),
    GRADUATE      ("Graduate"),
    HSC_A_LEVEL   ("HSC/A Level"),
    SSC_O_LEVEL   ("SSC/O Level"),
    JSC_JDC       ("JSC/JDC"),
    PSC           ("PSC"),
    KG            ("KG"),
    NONE          ("None")

    final String value

    AcademicQualification(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}