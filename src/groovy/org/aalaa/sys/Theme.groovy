/**
 * @Created_By : AALAA
 * @Date       : 2018.12.31 02:42:18 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

enum Theme {
    BLUE         ("Blue"),
    BLACK        ("Black"),
    PURPLE       ("Purple"),
    GREEN        ("Green"),
    RED          ("Red"),
    YELLOW       ("Yellow"),
    BLUE_LIGHT   ("Blue Light"),
    BLACK_LIGHT  ("Black Light"),
    PURPLE_LIGHT ("Purple Light"),
    GREEN_LIGHT  ("Green Light"),
    RED_LIGHT    ("Red Light"),
    YELLOW_LIGHT ("Yellow Light")

    final String value

    Theme(String value) {
        this.value = value
    }

    String getKey() { name() }

    @Override
    String toString() { value }
}