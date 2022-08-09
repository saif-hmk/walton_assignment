package org.aalaa.com

enum EmployeeType {
    Regular("Regular"),
    Contractual("Contractual"),
    OutSource("Out Source")

    final String value

    EmployeeType(String value) {
        this.value = value
    }

    String toString() { value }

    String getKey() { name() }
}
