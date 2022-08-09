package org.aalaa.cmd

enum CommandType {  //Terminal
    WINDOWS_BAT ("Windows (.bat)"),
    LINUX_SHELL ("Linux (.sh)"),
    JAVA        ("Java (.java)"),
    DB_SQL      ("DB (.sql)")

    final String value

    CommandType(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}
