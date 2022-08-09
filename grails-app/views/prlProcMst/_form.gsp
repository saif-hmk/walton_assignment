<!--
 @Created_By : AALAA
 @Date       : 2022.08.08 01:49:18 AM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='form'>

    <div class='col-xs-12 col-sm-6 col-md-6 col-lg-6'>
        <div class='form-group ${hasErrors(bean: prlProcMstInstance, field: 'prlPeriod', 'has-error')} required'>
            <label class='required'><g:message code="label.prlProcMst.prlPeriod" default="Prl Period"/></label>
            <g:select name="prlPeriod" class="form-control many-to-one" from="${org.aalaa.prl.PrlPeriod.list().sort{it.id}}" value="${prlProcMstInstance?.prlPeriod?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${prlProcMstInstance}' field='prlPeriod'/>
        </div>
    </div>

</fieldset>
