/**
 * @Created_By : AALAA
 * @Date       : 2018.07.28 07:12:11 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.rpt

enum ReportFormat {
    CSV   ("CSV"),
    DOCX  ("DOCX"),
    HTML  ("HTML"),
    ODS   ("ODS"),
    ODT   ("ODT"),
    PDF_D ("PDF - Download"),
    PDF_V ("PDF - View"),
    PPTX  ("PPTX"),
    RTF   ("RTF"),
    TEXT  ("TEXT"),
    XLS   ("XLS"),
    XLSX  ("XLSX"),
    XML   ("XML")

    final String value

    ReportFormat(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}