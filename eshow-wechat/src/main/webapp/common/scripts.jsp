<%@ include file="/common/jquery.jsp"%>
<script>window.eshow={ctx:"${ctx}"};window.UEDITOR_HOME_URL = "${ctx}/umeditor/";</script>
<script src="http://apps.bdimg.com/libs/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="${dll}/scripts/base.js"></script>
<script type="text/javascript">
    if(${current=='frame'}){
        $("[pr='frame']").addClass("nav_active");
    }
</script>