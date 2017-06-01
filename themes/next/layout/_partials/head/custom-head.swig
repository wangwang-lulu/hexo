{#
Custom head.
#}
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $("#button").click(function(){
        $("div.content").toggleClass("new");
        $("article").toggleClass("grid");
        $("div.main-inner").toggleClass("ginner");
        $("p").toggleClass("gp");
    });
});
</script>