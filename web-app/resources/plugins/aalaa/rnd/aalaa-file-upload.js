/**
 * Created by hoshen.mahmud on 12-Jul-16.
 */
//==================================================================================================================================
//  File Upload
//----------------------------------------------------------------------------------------------------------------------------------
$(document).on('change', '.btn-file :file', function () {
    $(this).parent('.input-group').find(':text').val($(this).val().replace(/\\/g, '/').replace(/.*\//, ''));
});
$(document).on('change', '.file', function () {
    var id = this.id;
    var value = this.value;
    var idSegments = id.split("_");
    var rowId = idSegments[1];
    if (value) {
        $("#requiredDocId_" + rowId).prop("checked", true);
        $("#fileName_" + rowId).val(value);
    }
});
//==================================================================================================================================
