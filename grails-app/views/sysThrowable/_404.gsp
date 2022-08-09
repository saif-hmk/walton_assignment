<%--
  @Modified By: AALAA
  @Date       : 2017.09.14
  @Time       : 10:22 PM

  @Author     : Md. Hoshen Mahmud Khan
  @Email      : saif_hmk@live.com
  @Phone      : +8801672036757
--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="aalaa"/>
    <g:set var="entityName" value="${message(code: "label.comThrowable.404", default: "Resource Not Found")}"/>
    <title>${entityName}</title>
</head>

<body>
<div class="content-wrapper">
    <section class="flash-message">
        <g:render template="../layouts/flashMessage"/>
    </section>
    <section class="content-header">
        <h1>${entityName}</h1>
        <ol class="breadcrumb">
            <li><a href="${request.contextPath}/"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">404 error</li>
        </ol>
    </section>
    <section class="content">
        <div class="error-page">
            <h2 class="headline text-yellow">404</h2>

            <div class="error-content">
                <h3><i class="fa fa-warning text-yellow"></i> Oops! Page not found.</h3>

                <p>
                    We could not find the page you were looking for.
                    Meanwhile, you may <a href="${request.contextPath}/">return to dashboard</a> or try using the search form.
                </p>

                <form class="search-form">
                    <div class="input-group">
                        <input type="text" name="search" class="form-control" placeholder="Search">

                        <div class="input-group-btn">
                            <button type="submit" name="submit" class="btn btn-warning btn-flat"><i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
</div>
</body>
</html>
