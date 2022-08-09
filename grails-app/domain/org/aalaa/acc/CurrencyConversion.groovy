package org.aalaa.acc

import org.aalaa.auth.AuthUser

class CurrencyConversion {
    AuthUser logCreatedBy,
             logModifiedBy;
    AccCurrency convertFrom,
                convertTo;
    Float    conversionRate
    Date     effectFromDate,
             effectToDate,
             logCreatedDate  = new Date(),
             logModifiedDate;

    static mapping = {
        version        false
        table          'com_currency_conversion'
        conversionRate scale: 2, length: 10
    }

    static constraints = {
        logCreatedBy      nullable: false, display:false;
        logCreatedDate    nullable: false, display:false;
        convertFrom    nullable: false
        convertTo      nullable: false
        conversionRate nullable: false
        effectFromDate nullable: false
        effectToDate   nullable: true

        logModifiedBy     nullable: true, display:false;
        logModifiedDate   nullable: true, display:false;
    }

    String toString() {
        return "1${convertFrom} = ${conversionRate}${convertTo}"
    }

    def afterInsert() {
        CurrencyConversion previousRecord = CurrencyConversion.createCriteria().get {
            eq("convertFrom", convertFrom)
            eq("convertTo", convertTo)
            lt("effectFromDate", effectFromDate)
            isNull("effectToDate")
            order("effectFromDate", "desc")
            maxResults(1)
        }
        if (previousRecord) {
            CurrencyConversion.withNewSession {
                previousRecord.setEffectToDate(effectFromDate - 1)
                previousRecord.setDateModified(logCreatedDate)
                previousRecord.setModifiedBy(logCreatedBy)
                previousRecord.save(flush: true)
            }

        }
        CurrencyConversion nextRecord = CurrencyConversion.createCriteria().get {
            eq("convertFrom", convertFrom)
            eq("convertTo", convertTo)
            gt("effectFromDate", effectFromDate)
            order("effectFromDate", "desc")
            maxResults(1)
        }
        if (nextRecord) {
            CurrencyConversion.withNewSession {
                this.setEffectToDate(nextRecord.effectFromDate - 1)
                this.setDateModified(logCreatedDate)
                this.setModifiedBy(logCreatedBy)
                this.save(flush: true)
            }
        }
    }
}
