/**
 * @Created_By : AALAA
 * @Date       : 2022.08.06 07:54:18 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.com

enum ApprovalStage {
    ENTRY     ("Entry"    ),
    SUBMITTED ("Submitted"),
    APPROVED  ("Approved" ),
    REJECTED  ("Rejected" )

    final String value

    ApprovalStage(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}
