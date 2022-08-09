/**
 * @Created_By : AALAA
 * @Date       : 2018.10.19 12:45:10 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.com

import grails.transaction.Transactional
import groovy.sql.GroovyRowResult
import groovy.sql.Sql
import org.aalaa.util.UtilityService
import org.codehaus.groovy.grails.commons.GrailsApplication

import java.sql.Clob
//import oracle.sql.CLOB

@Transactional
class DbService {
    GrailsApplication grailsApplication
    UtilityService    utilityService
    def               dataSource

    Object callFunction(String functionName, String paramsAsCsv) {
        return new Sql(dataSource).firstRow("SELECT " + functionName + "(" + paramsAsCsv + ") AS R FROM DUAL")
    }

    String getStringFromClob(Clob clob) {
        Reader r = clob.getCharacterStream();
        StringBuffer buffer = new StringBuffer();
        int ch;
        while ((ch = r.read()) != -1) {
            buffer.append("" + (char) ch);
        }
        return buffer.toString()
    }

    /**
     * @Example: SELECT COUNT(*) TOTAL FROM DUAL
     **/
    Integer countResultSet(String query){
        Integer totalRecord
        Sql sql = new Sql(dataSource)
        try {
            totalRecord = Integer.parseInt(sql.firstRow(query).get("TOTAL").toString())
        } catch (Exception e) {
            println e
        } finally{
            sql.close()
            System.gc()
        }
        return totalRecord
    }

    /**
     * @Example: SELECT COUNT(*) TOTAL FROM DUAL
     **/
    Integer countResultSet(String query, Map<String, Object> params){
        Integer totalRecord
        Sql sql = new Sql(dataSource)
        try {
            totalRecord = Integer.parseInt(sql.firstRow(query, params).get("TOTAL").toString())
        } catch (Exception e) {
            println e
        } finally{
            sql.close()
            System.gc()
        }
        return totalRecord
    }

    GroovyRowResult getFirstResult(String query){
        return getResultSet(query)?.get(0)
    }

    GroovyRowResult getFirstResult(String query, Map<String, Object> params){
        return getResultSet(query, params)?.get(0)
    }

    Object executeSqlFile(String path) { //'path/to/your/script.sql'
        return executeSqlScript(grailsApplication.mainContext.getResource(path).inputStream.getText())
    }

    Object executeSqlFile(File path) {
        return executeSqlScript(path.getText())
    }

    Object executeSqlScript(String script) {
        //return new Sql(dataSource).execute(script)
        Sql sql = new Sql(dataSource)
        return executeSql(sql, script)
    }

    /*
    * ----------------------------------------------------------
    * import org.codehaus.groovy.grails.commons.ConfigurationHolder
    * ----------------------------------------------------------
    * url             : ConfigurationHolder.config.dataSource.url
    * username        : ConfigurationHolder.config.dataSource.username
    * password        : ConfigurationHolder.config.dataSource.password
    * driverClassName : ConfigurationHolder.config.dataSource.driverClassName
    * def sql = Sql.newInstance("jdbc:mysql://localhost:3306/test", "root", "root", "com.mysql.jdbc.Driver")
    * ----------------------------------------------------------
    */
    Object executeSql(String url, String username, String password, String driverClassName, String script) {
        Sql sql = Sql.newInstance(url, username, password, driverClassName)
        return executeSql(sql, script)
    }

    Object executeSql(Sql sql, String script) {
        return sql.execute(script)  //sql.close()
    }

    Boolean executeQuery(String query){
        Boolean isExecutedSuccessfully = true
        Sql sql = new Sql(dataSource)
        try {
            isExecutedSuccessfully = sql.execute(query)
        } catch (Exception e) {
            println e
            isExecutedSuccessfully = false
        } finally{
            sql.close()
        }
        return isExecutedSuccessfully
    }

    String generateInsertStatement(String tableName, String[] keySet, List<ArrayList> valueSetList) {
        StringBuilder script = new StringBuilder()
        for (vs in valueSetList){
            script.append("INSERT INTO ${tableName} (${utilityService.getCsvFromArrayList(keySet)}) values (${utilityService.getCsvFromArrayList(vs)});\n")
        }
        script ? script.append("SET DEFINE OFF;") : null
        script ? (script = "SET DEFINE OFF;\n" + script.append("COMMIT;").toString()) : null
        return script
    }

    List<GroovyRowResult> getResultSet(String query){
        ArrayList<GroovyRowResult> resultSet = new ArrayList()
        Sql sql = new Sql(dataSource)
        try {
            resultSet = sql.rows(query)
        } catch (Exception e) {
            println e
        } finally{
            sql.close()
        }
        return resultSet
    }

    List<GroovyRowResult> getResultSet(String query, Map<String, Object> params){
        ArrayList<GroovyRowResult> resultSet = new ArrayList()
        Sql sql = new Sql(dataSource)
        try {
            resultSet = sql.rows(query, params)
        } catch (NullPointerException e) {
            println e
        } catch (Exception e) {
            println e
        } finally{
            sql.close()
        }
        return resultSet
    }
}
