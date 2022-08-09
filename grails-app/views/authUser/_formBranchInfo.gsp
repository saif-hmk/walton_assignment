<!--
 @Created_By : AALAA
 @Date       : 2019.10.12 02:17:12 AM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<div class="box-body">
    <fieldset>
        <legend><g:message code="label.authUser.tabTitle.branchAssignment" default="Branch Assignment"/></legend>
        <table class="table table-bordered table-striped table-hover table-condensed display nowrap th-center th-colored">
            <thead>
            <tr>
                <th>
                    <input type="checkBox" class="checkAll"/>
                    ${message(code: 'default.button.action'           , default: 'Action')}
                </th>
                <th>${message(code: 'label.admVendorOrganization.pageTitle' , default: 'Organization')}</th>
                <th>${message(code: 'label.admBranch.code'                  , default: 'Branch Code')} </th>
                <th>${message(code: 'label.admBranch.titleShort'            , default: 'titleShort')}  </th>
                <th>${message(code: 'label.admBranch.pageTitle'             , default: 'Branch')}      </th>
            </tr>
            </thead>
            <tbody>
            <g:if test="${admBranchList}">
                <g:each in="${admBranchList}" status="i" var="admBranchInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td class="center">
                            <g:if test="${permittedBranches?.toString()?.contains(admBranchInstance?.keyword)}">
                                <g:checkBox class="cbX cb-au checkThis" name="authUserLkBranch.admBranch.${admBranchInstance?.keyword}" checked="true"/>
                            </g:if>
                            <g:else>
                                <g:checkBox class="cbX cb-au checkThis" name="authUserLkBranch.admBranch.${admBranchInstance?.keyword}"/>
                            </g:else>

                            <g:hiddenField name="authUserLkBranch.admBranch.${admBranchInstance?.keyword}" value="${permittedBranches?.toString()?.contains(admBranchInstance?.keyword) ? true : ""}"/>
                        </td>
                        <td class="left"><lable>${admBranchInstance.admVendorOrganization}</lable></td>
                        <td class="left"><lable>${admBranchInstance.code                 }</lable></td>
                        <td class="left"><lable>${admBranchInstance.titleShort           }</lable></td>
                        <td class="left"><lable>${admBranchInstance.title                }</lable></td>
                    </tr>
                </g:each>
            </g:if>
            </tbody>
        </table>

    </fieldset>
</div>
