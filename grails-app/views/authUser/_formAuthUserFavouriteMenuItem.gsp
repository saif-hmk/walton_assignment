<!--
 @Created_By : AALAA
 @Date       : 2020.02.11 12:10:34 AM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->
<g:form url="[resource: authUserInstance, action: 'profile']" method="POST">
    <div class="box-header with-border">
        <h3 class="box-title"><g:message code="label.authUser.favouriteMenuItem" default="Favourite Menu Item"/></h3>

        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            %{--<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>--}%
        </div>
    </div>

    <div class="box-body no-padding">
        <g:hiddenField name="version" value="${authUserInstance?.version}"/>
        <table class="table md-table-am table-bordered table-striped table-hover table-condensed display nowrap th-center tf-center th-colored tf-colored">
            <thead>
            <tr>
                <th class='required'><g:message code="label.authUserFavouriteMenuItem.authMenu" default="Auth Menu"/></th>
                <th class='required'><g:message code="label.authUserFavouriteMenuItem.code" default="Code"/></th>
                <th><g:message code="default.button.action" default="Actions"/></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${authUserFavouriteMenuItemList ?: new org.aalaa.auth.AuthUserFavouriteMenuItem(params)}" status="i" var="authUserFavouriteMenuItemInstance">
                <tr>
                    <td>
                        <div class='form-group ${hasErrors(bean: authUserFavouriteMenuItemInstance, field: 'authMenu', 'has-error')} required'>
                            <select class="form-control select-with-searchX" name="authUserFavouriteMenuItem[${i}].authMenu" required="required">
                                <option value="">Select One</option>
                                <g:each in="${authMenuList}" var="ml">
                                    <g:if test="${ml?.url?.toString()?.contains("#")}">
                                        <option value="${ml.id}" class="c-black disabled" disabled="disabled">${ml.title}</option>
                                    </g:if>
                                    <g:else>
                                        <option class="c-success" value="${ml.id}" ${authUserFavouriteMenuItemInstance?.authMenu?.id ? (ml?.id == authUserFavouriteMenuItemInstance?.authMenu?.id ? " selected" : null) : null}>${ml?.title}</option>
                                    </g:else>
                                </g:each>
                            </select>
                            <g:renderErrors bean='${authUserFavouriteMenuItemInstance}' field='authMenu'/>
                        </div>
                    </td>
                    <td>
                        <div class='form-group ${hasErrors(bean: authUserFavouriteMenuItemInstance, field: 'code', 'has-error')}'>
                            <g:textField name="authUserFavouriteMenuItem[${i}].code" class="form-control" value="${authUserFavouriteMenuItemInstance?.code}" maxlength="30" required="required"/>
                            <g:renderErrors bean='${authUserFavouriteMenuItemInstance}' field='code'/>
                        </div>
                    </td>
                    <td class="center">
                        <button type="button" class="btn btn-sm btn-primary addMore" name="authUserFavouriteMenuItem[${i}].btnAddMore"><i class='fa fa-plus'></i></button>
                        <g:hiddenField name="authUserFavouriteMenuItem[${i}].id"                value="${authUserFavouriteMenuItemInstance?.id}"/>
                        <g:hiddenField name="authUserFavouriteMenuItem[${i}].version"           value="${authUserFavouriteMenuItemInstance?.version ?: 0}"/>
                        <g:hiddenField name="authUserFavouriteMenuItem[${i}].authUserProfile"   value="${authUserProfileInstance?.id}" class="dont-reset"/>
                        <button type="button" class="btn btn-sm btn-danger del removeThis" name="authUserFavouriteMenuItem[${i}].btnRemoveThis"><i class='fa fa-trash-o'></i></button>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="box-footer">
        <fieldset class="buttons">
            <sec:access url="/authUser/profile/${authUserInstance?.id}">
                <button type="submit" class="btn btn-success"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> ${message(code: "default.button.update", default: "Update")}</button>
            </sec:access>
        </fieldset>
    </div>
</g:form>
