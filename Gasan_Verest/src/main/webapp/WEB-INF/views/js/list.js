$(document).ready(function(){
    $(".category li").click(function(){
        var category = $(this).attr("title");
        $(".category li").css("color", "#333")
        $(".category li").css("border-radius", "50px")
        $(this).css("border-radius", "5px")
        $(this).css("color", "#fff");
        $(".content .list").css("display","none");
        if(category == "all"){
            $(".content .list").stop().fadeIn("fast");
        } else {
            $(".content .list[class*="+category+"]").stop().fadeIn("fast");
        }
    });
});