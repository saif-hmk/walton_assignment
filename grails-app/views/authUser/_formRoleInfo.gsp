<!--
 @Created_By : AALAA
 @Date       : 2019.10.12 02:17:12 AM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<div class="box-body">
    <fieldset>
        <legend><g:message code="label.authUser.tabTitle.roleAssignment" default="Role Assignment"/></legend>
        <table class="table table-bordered table-striped table-hover table-condensed display nowrap th-center th-colored">
            <thead>
            <tr>
                <th>${message(code: 'default.button.action', default: 'Action')}</th>
                <th>${message(code: 'label.authUserLkRole.authRole', default: 'Role')}</th>
            </tr>
            </thead>
            <tbody>
            <g:if test="${authRoleList}">
                <g:each in="${authRoleList}" status="i" var="authRoleInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td class="center">
                            <g:if test="${permittedRoles?.toString()?.contains(authRoleInstance?.authority)}">
                                <g:checkBox class="cbX cb-au" name="authUserLkRole.authRole.${authRoleInstance.authority}" checked="true"/>
                            </g:if>
                            <g:else>
                                <g:checkBox class="cbX cb-au" name="authUserLkRole.authRole.${authRoleInstance.authority}"/>
                            </g:else>

                            <g:hiddenField name="authUserLkRole.authRole.${authRoleInstance.authority}" value="${permittedRoles?.toString()?.contains(authRoleInstance.authority) ? true : ""}"/>
                        </td>
                        <td class="left">
                            <lable>${authRoleInstance.authority}</lable>
                        </td>
                    </tr>
                </g:each>
            </g:if>
            </tbody>
        </table>

    </fieldset>
</div>