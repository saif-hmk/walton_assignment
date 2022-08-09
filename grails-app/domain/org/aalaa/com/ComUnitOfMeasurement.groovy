/**
 * @Created_By : AALAA
 * @Date       : 2022.06.15 05:51:39 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.com

class ComUnitOfMeasurement extends ComLookup {
    ComUnitOfMeasurementCategory measurementCategory

    String                       symbol,
                                 distance

    static constraints = {
        parent              display: false

        measurementCategory nullable: false
        title               unique: ['measurementCategory', 'parent']
        keyword             unique: ['measurementCategory', 'parent']

        symbol              nullable: true, size: 1..50
        distance            nullable: true, size: 1..100
    }
}
