<g:set var="permittedBranchList" value="${applicationContext.authUserService.getCurrentUserBranches()}"/>
<g:if test="${permittedBranchList && permittedBranchList.size() > 1}">
    <li><g:select name="admBranch" id='admBranchId' class="top-link-select pull-right" from="${permittedBranchList}" value="${params.admBranch}" optionKey="id" optionValue="${{it.code + "-" + it.title}}" noSelection="['0': 'Select Branch']"/></li>
</g:if>
