$(function () {
    "use strict";
    var url = window.location + "";
    var path = url.replace(
        window.location.protocol + "//" + window.location.host + "/",
        ""
    );
    var controller = path.split("/"); // Get the controller part of the URL
    if (controller[0] !== "site" && controller[0] !== "email-tamplate") {
        // Remove the last element if it's "index"
        controller.pop();
    }else if(controller[0] === "email-tamplate"){
        controller[1] = controller[1].split("?")[1];
    }

    // Check if the controller is not empty before selecting and activating
    if (controller.length > 0) {
        var element = $("ul#sidebarnav a").filter(function () {
            var href = this.href;
            // Check if each element in the controller is included in the href

            var isMatch = controller.every(function (item) {
                if(href.includes("dashboard")){
                    return false
                }
                return href.includes(item);
            });

            return href === url || isMatch;
        });

        element.parentsUntil(".sidebar-nav").each(function (index) {
            if ($(this).is("li") && $(this).children("a").length !== 0) {
                $(this).children("a").addClass("active");
                $(this).parent("ul#sidebarnav").length === 0
                    ? $(this).addClass("active")
                    : $(this).addClass("selected");
            } else if (!$(this).is("ul") && $(this).children("a").length === 0) {
                $(this).addClass("selected");
            } else if ($(this).is("ul")) {
                $(this).addClass("in");
            }
        });

        element.addClass("active");
    }

    $("#sidebarnav a").on("click", function (e) {
        if (!$(this).hasClass("active")) {
            // hide any open menus and remove all other classes
            $("ul", $(this).parents("ul:first")).removeClass("in");
            $("a", $(this).parents("ul:first")).removeClass("active");

            // open our new menu and add the open class
            $(this).next("ul").addClass("in");
            $(this).addClass("active");
        } else if ($(this).hasClass("active")) {
            $(this).removeClass("active");
            $(this).parents("ul:first").removeClass("active");
            $(this).next("ul").removeClass("in");
        }
    });


});
