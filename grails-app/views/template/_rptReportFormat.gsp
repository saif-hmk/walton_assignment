<div class="${mc_rptReportFormat ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class="form-group ${bean ? hasErrors(bean: bean, field: "${f_rptReportFormat ?: "rptReportFormat"}", 'has-error') : ""}">
        <label><g:message code="label.rptReport.reportFormat" default="Report Format"/></label>
        <g:select id="${i_rptReportFormat ?: "rptReportFormat"}"
                  name="${n_rptReportFormat ?: "P_REPORT_FORMAT"}"
                  class="form-control many-to-one ${c_rptReportFormat ?: "rptReportFormat"}"
                  from="${[
                          CSV : "CSV",
                          DOCX: "DOCX",
                          HTML: "HTML",
                          ODS : "ODS",
                          ODT : "ODT",
                          PDF : "PDF",
                          PPTX: "PPTX",
                          RTF : "RTF",
                          TEXT: "TEXT",
                          XLS : "XLS",
                          XLSX: "XLSX",
                          XML : "XML"
                  ]}"
                  value="${rptReportFormat ?: params.rptReportFormat}"
                  optionKey="key" optionValue="value" noSelection="['': 'Select One']"
        />
        <g:renderErrors bean="${bean}" field="${f_rptReportFormat ?: "rptReportFormat"}"/>
    </div>
</div>
