{#
Custom head.
#}
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $("#button1").click(function(){
        $("div.content").toggleClass("new");
        $("article").toggleClass("grid");
        $("div.main-inner").toggleClass("ginner");
        $("p").toggleClass("gp");
        $("h1").toggleClass("gh1");
        $("div.post-meta").toggleClass("gmeta");
    });
});
</script>

<script>
$(document).ready(function(){
    $("#button2").click(function(){
        $("img").toggleClass("img-flist");
        $("h1").toggleClass("lh1");
        $("article").toggleClass("list");
        $("div.post-meta").toggleClass("lmeta");
    });
});
</script>