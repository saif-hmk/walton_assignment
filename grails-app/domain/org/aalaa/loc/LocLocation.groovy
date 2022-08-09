/**
 * @Created_By : AALAA
 * @Date       : 2017.02.06 03:02:13 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/
package org.aalaa.loc

import org.aalaa.auth.AuthUser

abstract class LocLocation {
    AuthUser       logCreatedBy,
                   logModifiedBy
    LocLocation    parent
    LocAdmAreaType locAdmAreaType

    String         code,
                   name,
                   nameNative,
                   establishmentDate,
                   acquired,
                   remarks
    BigInteger     population
    Integer        censusYear
    Float          areaTotalSqMile,
                   areaTotalSqKm,
                   areaLandSqMile,
                   areaLandSqKm,
                   areaWaterSqMile,
                   areaWaterSqKm,
                   populationDensitySqKm
    Boolean        isActive          = true
    Date           logCreatedDate    = new Date(),
                   logModifiedDate

    static mapping = {
        table 'A_LOC_LOCATION'
        parent column: 'PARENT_ID'
        sort name: 'asc'
    }

    static constraints = {
        isActive              nullable: false
        code                  nullable: false, size: 0..30
        name                  nullable: false, size: 0..60
        nameNative            nullable: false, size: 0..120
        locAdmAreaType        nullable: false, size: 0..30, display : false
        logCreatedBy          nullable: false, display : false
        logCreatedDate        nullable: false, display : false

        parent                nullable: true
        population            nullable: true
        censusYear            nullable: true
        areaTotalSqMile       nullable: true
        areaTotalSqKm         nullable: true
        areaLandSqMile        nullable: true
        areaLandSqKm          nullable: true
        areaWaterSqMile       nullable: true
        areaWaterSqKm         nullable: true
        remarks               nullable: true
        populationDensitySqKm nullable: true
        acquired              nullable: true, size: 0..100
        establishmentDate     nullable: true, size: 0..100
        logModifiedDate       nullable: true, display : false
        logModifiedBy         nullable: true, display : false
    }

    @Override
    String toString() {
        return name
    }
}
