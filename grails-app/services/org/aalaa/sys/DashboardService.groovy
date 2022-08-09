/**
 * @Created_By : AALAA
 * @Date       : 2021.11.27 07:11:10 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

import grails.converters.JSON
import grails.transaction.Transactional
import org.aalaa.com.DbService
import org.aalaa.util.UtilityService

import javax.servlet.http.HttpServletRequest

@Transactional
class DashboardService {
    UtilityService  utilityService
    DbService       dbService
    SystemService   systemService

    Map getDashboard(String paramsAsCsv) {
        Map m = new LinkedHashMap()
        //println "|Dashboard Params as CSV: " + paramsAsCsv
        String s = dbService.getStringFromClob(dbService.callFunction("F_DB_COMPONENTS_AS_JSON", paramsAsCsv).get("R"))
        if(!s.equals(null)){
            m = utilityService.getMapFromJson(s)
        }
        println "\n|Dashboard Output From Server: " + (m as JSON) + "\n\n";
        return m
    }

    //todo: move to front end
    String generateComponentTabularCt(ArrayList datum, HttpServletRequest request) {
        StringBuilder content = new StringBuilder("<fieldset>")
        for (m in systemService.getComponentGroupList()) {
            if (datum?.componentGroup?.indexOf(m.key) < 0) continue;
            content.append("<div class='row p-l-15 p-r-15'><legend>${m}</legend>")
            for (d in datum.findAll { it.componentGroup == m.key }.sort { Integer.parseInt(it.sortOrder) }) {
                if (!d.data) continue;
                String dynamicColumnName = d.data.columns[d.data.columns.size() - 2]
                ArrayList<String> commonColumns = new ArrayList()
                for (int i = 0; i < d.data.columns.size() - 2; i++) {
                    commonColumns.add(d.data.columns[i]);
                }
                Set dynamicColumns = new LinkedHashSet()
                for (i in d.data.values) {
                    dynamicColumns.add(i[i.size() - 2]);
                }
                String aggregateFuncType = d.data?.AGGR_FUNC_COL
                int dynamicColumnSize = dynamicColumns.size(), aggregateColumnSize = (aggregateFuncType ? 1 : 0)
                content.append("<table class='table table-bordered table-striped table-hover table-condensed display nowrap th-center th-colored'>" )
                content.append("<thead><tr><th colspan='${commonColumns.size() + dynamicColumnSize + aggregateColumnSize}'>${d.title}</th></tr><tr>")
                for (c in commonColumns) {
                    content.append("<th rowspan='2'>${c}</th>")
                }
                content.append("<th${dynamicColumnSize > 1 ? (" colspan='" + dynamicColumnSize + "'") : ""}>${dynamicColumnName}</th>")
                if(aggregateColumnSize){
                    content.append("<th rowspan='2'>${aggregateFuncType == "SUM" ? "Total" : ""}</th>")
                }
                content.append("</tr><tr>")
                for (c in dynamicColumns) {
                    content.append("<th>${c}</th>")
                }
                content.append("</tr></thead><tbody>")
                for (g in d.data.values.groupBy { it[d.data.values[0].size() - 3] }) {
                    content.append("<tr>")
                    Map vm = new LinkedHashMap()
                    for (v in g.value) vm.put(v[v.size() - 2], v[v.size() - 1])
                    for (v in g.value) {
                        Double colSum = 0.0D, rowSum = 0.0D
                        for (int i = 0; i < commonColumns.size(); i++) {
                            content.append("<td>${v[i]}</td>")
                        }
                        for (int i = 0; i < dynamicColumnSize; i++) {
                            if (vm[dynamicColumns[i]]) {
                                content.append("<td>${vm[dynamicColumns[i]]}</td>")
                                if(aggregateFuncType && aggregateFuncType == "SUM")
                                    colSum += Double.valueOf(vm[dynamicColumns[i]].toString())
                            } else {
                                content.append("<td></td>")
                            }
                        }
                        if(aggregateFuncType != null & aggregateFuncType == "SUM") content.append("<td>${colSum}</td>")
                        break;
                    }
                    content.append("</tr>")
                }

                content.append("</tbody></table>")
            }
            content.append("</div>")
        }
        content.append("</fieldset>")
        return content.toString()
    }
}
