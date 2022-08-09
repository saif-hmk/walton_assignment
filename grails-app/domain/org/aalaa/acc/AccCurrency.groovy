/**
 * @Created_By : AALAA
 * @Date       : 2022.06.16 11:33:23 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.acc

import org.aalaa.com.ComLookup

class AccCurrency extends ComLookup {
    CurrencyType currencyType

    String       codeDigital,
                 codeIso,
                 codeIso4217,
                 codeUnOfficial,
                 currencyNumber,
                 dateFrom,
                 dateUntil,
                 decimalPlaces,
                 note,
                 oneUnitEqualsTo,
                 replacedBy,
                 symbol,
                 tiedTo,
                 usedIn

    static mapping = {
        version true
        table 'A_ACC_CURRENCY'

        sort currencyType: 'desc'
        sort title       : 'asc'
    }

    static constraints = {
        parent          nullable: true, display: false

        title           unique: ['currencyType']
        keyword         unique: ['currencyType']

        codeIso         nullable: true, unique: true
        codeDigital     nullable: true, unique: true
        codeIso4217     nullable: true
        codeUnOfficial  nullable: true
        currencyNumber  nullable: true
        currencyType    nullable: true
        dateFrom        nullable: true
        dateUntil       nullable: true
        decimalPlaces   nullable: true
        note            nullable: true
        oneUnitEqualsTo nullable: true
        replacedBy      nullable: true
        symbol          nullable: true
        tiedTo          nullable: true
        usedIn          nullable: true, size: 1..1000
    }
}
