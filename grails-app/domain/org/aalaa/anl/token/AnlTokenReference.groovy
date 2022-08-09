package org.aalaa.anl.token

class AnlTokenReference {
    AnlToken token

    String   referenceTable
    Long     referenceTableId

    static mapping = {
        table  'a_anl_token_reference'
    }

    static constraints = {
        token            nullable: false
        referenceTable   nullable: false
        referenceTableId nullable: false
    }

    @Override
    String toString() {
        return referenceTableId
    }
}
