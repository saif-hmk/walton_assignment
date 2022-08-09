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
    <g:set var="entityName" value="${message(code: "label.comThrowable.500", default: "Internal Server Error")}"/>
    <title>${entityName}</title>
</head>

<body>
<div class="content-wrapper">
    <section class="flash-message p-t-2">
        <g:render template="../layouts/flashMessage"/>
    </section>
    <section class="content">
        <div class="box box-solid box-danger collapsed-box">
            <div class="box-header">
                <h1 class="box-title">${entityName}</h1>

                <div class="box-tools pull-right">
                    <button class="btn btn-default btn-sm" data-widget="collapse"><i class="fa fa-plus"></i></button>
                </div>
            </div>

            <div class="box-body p-15">
                <g:renderException exception="${exception}"/>
            </div>
        </div>
    </section>
    <section>
        <div class="error-page">
            <h2 class="headline text-red">500</h2>

            <div class="error-content">
                <h3><i class="fa fa-warning text-red"></i> Oops! Something went wrong.</h3>

                <p>
                    We will work on fixing that right away.
                    Meanwhile, you may <a href="${request.contextPath}/">return to dashboard</a> or try using the search form.
                </p>

                <form class="search-form">
                    <div class="input-group">
                        <input type="text" name="search" class="form-control" placeholder="Search">

                        <div class="input-group-btn">
                            <button type="submit" name="submit" class="btn btn-danger btn-flat"><i class="fa fa-search"></i>
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
