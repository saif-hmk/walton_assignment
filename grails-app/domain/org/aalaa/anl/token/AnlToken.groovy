package org.aalaa.anl.token

class AnlToken {
    String keyword,
           value

    static mapping = {
        table 'a_anl_token'
    }

    static constraints = {
        keyword nullable: false, size: 1..30, matches: "[A-Z0-9_]+", unique: true

        value   nullable: true
    }
}
