package org.aalaa.sys

enum Module {
    ENT               ("Enrollment"               , 05 ),
    FDT               ("Fund Management"          , 10 ),
    NM                ("Notification Management"  , 15 ),
    AUTH              ("Authentication Management", 20 ),
    COM               ("Common"                   , 25 ),
    RPT               ("Report"                   , 30 ),
    SYS               ("System"                   , 35 ),

    final String  value
    final Integer sortOrder

    Module(String value) {
        this.value = value
    }

    Module(String value, Integer sortOrder) {
        this.value     = value
        this.sortOrder = sortOrder
    }

    String getKey() { name() }

    @Override
    String toString() { value }
}