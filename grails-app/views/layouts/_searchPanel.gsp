<%@ page import="org.aalaa.sys.SearchBoxMode" %>
<!-- search form -->
<g:if test="${sbm.equals("LEFT")}">
    <div class="sidebar-form">
        <div class="input-group">
            <input type="number" name="authMenuCode" maxlength="6" class="form-control authMenuCode" placeholder="Search (Menu Code)">
            <span class="input-group-btn">
                <button type="button" name="search" id="search-btn" class="btn btn-flat">
                    <i class="fa fa-search"></i>
                </button>
            </span>
        </div>
    </div>
</g:if>
<g:elseif test="${sbm.equals("TOP")}">
    <div class="search-box">
        <div class="input-group">
            <i class="fa fa-search fa-flip-horizontal"></i>
            <input type="text" name="authMenuCode" id="navbar-search-input" class="authMenuCode" maxlength="6" placeholder="Search (Menu Code)">
        </div>
    </div>
</g:elseif>
<!-- /.search form -->