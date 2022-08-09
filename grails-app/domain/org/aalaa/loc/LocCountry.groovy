/**
 * @Created_By : AALAA
 * @Date : 2017.02.06 03:02:13 AM
 * @Author : Md. Hoshen Mahmud Khan
 * @Email : saif_hmk@live.com
 * @Phone : +8801672036757
 **/
package org.aalaa.loc

class LocCountry extends LocLocation {
    LocAdmAreaType locAdmAreaType = LocAdmAreaType.COUNTRY

    String         codeIso,
                   continent,
                   cityCapital,
                   cityCapitalNative,
                   cityCapitalPrevious,
                   cityCapitalPreviousNative,
                   cityLargest,
                   cityLargestNative,
                   languageOfficial,
                   languageOfficialNative,
                   languageOfficialAddl,
                   languageOfficialAddlNative,
                   primaryCurrencyName,
                   primaryCurrencyCode,
                   whoRegion,
                   wbIncomeGroup

    static constraints = {
        codeIso                    nullable: true, size: 2..6, unique: true
        continent                  nullable: true, size: 0..50
        cityCapital                nullable: true, size: 0..100
        cityCapitalNative          nullable: true, size: 0..100
        cityCapitalPrevious        nullable: true, size: 0..100
        cityCapitalPreviousNative  nullable: true, size: 0..100
        cityLargest                nullable: true, size: 0..100
        cityLargestNative          nullable: true, size: 0..100
        languageOfficial           nullable: true, size: 0..100
        languageOfficialNative     nullable: true, size: 0..100
        languageOfficialAddl       nullable: true, size: 0..100
        languageOfficialAddlNative nullable: true, size: 0..100
        primaryCurrencyName        nullable: true, size: 0..100
        primaryCurrencyCode        nullable: true, size: 0..100
        whoRegion                  nullable: true, size: 0..100
        wbIncomeGroup              nullable: true, size: 0..100
        parent                     nullable: true, display : false
    }
}
