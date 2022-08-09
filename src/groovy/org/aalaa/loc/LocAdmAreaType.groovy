/**
 * @Created_By : AALAA
 * @Date       : 2017.02.06 03:02:13 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.loc

/**
 * @title: LocAdmAreaType
 * @description: Administrative Area Type
**/
enum LocAdmAreaType {
    WORLD            ("World"            ),
    CONTINENT        ("Continent"        ),
    COUNTRY          ("Country"          ),
    PROVINCE_STATE   ("Province or State"),
    DIVISION         ("Division"         ),
    DISTRICT         ("District"         ),
    CITY_CORPORATION ("City Corporation" ),
    SUB_DISTRICT     ("Upazila"          ),
    MUNICIPALITY     ("Municipality"     ),
    UNION_COUNCIL    ("Union Parishad"   ),
    WARD             ("Ward"             ),
    VILLAGE          ("Village"          ),

    final String value

    LocAdmAreaType(String value) {
        this.value = value
    }

    String getKey() { name() }

    @Override
    String toString() { value }
}
