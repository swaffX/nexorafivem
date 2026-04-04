var translate = [];

window.addEventListener("message", function (event) {
    var v = event.data;
    switch (v.action) {
        case "show":
            $(".motelLocationText").html(translate.location);
            $(".lastLocationText").html(translate.location);
            $(".hospitalLocationText").html(translate.location);
            $(".pdLocationText").html(translate.location);
            $(".sdLocationText").html(translate.location);
            $(".carShopLocationText").html(translate.lastLocation);
            setMotel(v.motelLoc);
            setHospital(v.hospitalLoc);
            setCarShop(v.carShopLoc);
            setPdDepartment(v.pdDepartmentLoc);
            setSdDepartment(v.sdDepartmentLoc);
            $(".generalSection").fadeIn(200);

            break;
        case "hide":
            $(".generalSection").fadeOut(200);
            break;
    }
});

function setMotel(data) {
    $(".motelPlayButton").attr("data-buttonId", data.uniqueId);
    $(".motelText").html(data.title);
    $(".motelDescriptionArea").html(data.description);
}

function setHospital(data) {
    $(".hospitalPlayButton").attr("data-buttonId", data.uniqueId);
    $(".hospitalText").html(data.title);
    $(".hospitalDescription").html(data.description);
}

function setCarShop(data) {
    $(".carShopPlayButton").attr("data-buttonId", data.uniqueId);
    $(".carShopCSText").html(data.title);
    $(".carShopDescription").html(data.description);
}

function setPdDepartment(data) {
    $(".pdPlayButton").attr("data-buttonId", data.uniqueId);
    $(".pdLocationPDText").html(data.title);
    $(".locationPDDescription").html(data.description);
}

function setSdDepartment(data) {
    $(".sdPlayButton").attr("data-buttonId", data.uniqueId);
    $(".sdDepartmentText").html(data.title);
    $(".sdDescription").html(data.description);
}

$(document).on("click", "#playButton", function () {
    var $this = this;
    var buttonId = $($this).attr("data-buttonId");
    $.post(
        "https://ak4y-spawnselector/selectSpawn",
        JSON.stringify({
            buttonId: buttonId,
        }),
        function () {}
    );
});

// $(document).on("keydown", function () {
//     switch (event.keyCode) {
//         case 27: // ESC
//             $.post("https://ak4y-treasurehunting/closeMenu", JSON.stringify());
//             $(".generalSection").hide();
//             $(".redeemCodeSection").hide();
//             $(".loadedSection").hide();
//             break;
//     }
// });
