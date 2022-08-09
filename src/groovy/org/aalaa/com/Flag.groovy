package org.aalaa.com

enum Flag {
    Yes("Yes"),
    No("No")

    final String value

    Flag(String value) {
        this.value = value
    }

    String toString() { value }

    String getKey() { name() }
}
