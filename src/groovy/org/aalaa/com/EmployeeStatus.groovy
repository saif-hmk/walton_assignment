package org.aalaa.com

enum EmployeeStatus {
    Continue("Continue"),
    Resigned("Resigned"),
    Terminated("Terminated"),
    Hold("Hold")

    final String value

    EmployeeStatus(String value) {
        this.value = value
    }

    String toString() { value }

    String getKey() { name() }
}
