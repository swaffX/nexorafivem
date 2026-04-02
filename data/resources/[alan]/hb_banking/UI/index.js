$(document).ready(function(){
    function display(bool) {
        if (bool) {
            $(".bankPanel").show();
        } else {
            $(".bankPanel").hide();
        }
    }

    function AnimationDisplay(bool) {
        if (bool) {
            setTimeout(function(){jQuery('.bankPanel').fadeIn('show')}, 600);
        } else {
            $(".bankPanel").fadeOut(400);
        }
    }
    var billingDatas = [];
    var openedForCompany = false
    display(false)
    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type == "ui") {
            AnimationDisplay(true)
            billingDatas = []
            openedForCompany = false
            clearTheUI()
            setupNameAmountAndIBAN(item.data)
            
            item.data.LastTransactions.forEach(element => {
                AddTransaction(element)
            });
            item.data.Bills.forEach(element => {
                AddBill(element)
            });
            if (item.openForCompany == true) {
                openedForCompany = true
            }else {
                
            }
        }
        else if(item.type == "addTransaction"){
            AddTransaction(item.transaction)
        } 
        else if(item.type == "message") {
            ShowMessage(item.icon, item.message)
            //BasarisizIslemGoster()
        }else if(item.type == "deleteBill") {
            billingDatas.forEach(element => {
                if (element.id == item.index) {
                    $('input[value="'+ String(billingDatas.indexOf(element)) +'"]').parent().remove()
                }
            })
        }
        else if(item.type = "updateBalance"){
            $("#playerMoneyAmount").html(addCommas((String(item.balance))))
            $("#playerMoneyAmount").append(",00")
            $("#playerMoneyAmount").prepend("$")
        }
    })

    $("#cikis").click(function() {
        AnimationDisplay(false)
        $.post('http://hb_banking/exit', JSON.stringify({}));
        return
    })

    document.onkeyup = function (data) {
        if (data.which == 27) {
            AnimationDisplay(false)
            $.post('http://hb_banking/exit', JSON.stringify({}));
            return
        }
    };

    const checkbox = document.getElementById("toggledark")
    var darkMode = false
    checkbox.addEventListener('change', ()=> {
        $(".bankPanel").toggleClass('darkness');
        $("button").toggleClass("darkness");
        $("a").toggleClass("darkness");
        $(".islemZaman").toggleClass("darkness");
        $("#islemler").toggleClass("darkness");
        $(".textislemler").toggleClass("darkness");
        $("#basarili").toggleClass("darkness");
        $(".fatura").toggleClass("darkness");
        $(".islem").toggleClass("darkness");
        if (darkMode == false) {
            darkMode = true
        }else {
            darkMode = false
        }
    });
    
    $("#parayiYatir").click(function(e) { // deposit
        var editedAmount = "$" + addCommas(String($("#yatirText").val())) + ",00";

        $.post('http://hb_banking/deposit', JSON.stringify({
            IBAN: $(".playerIBAN").text(),
            status: 'Deposit',
            amount: $("#yatirText").val(),
            time: GetDateAndTime(),
            comingFrom: '',
            editedAmount: editedAmount,
            openedForCompany: openedForCompany
        }));
    });

    $("#paraCek").click(function(e) {
        var editedAmount = "$" + addCommas(String($("#cekText").val())) + ",00";

        $.post('http://hb_banking/withdraw', JSON.stringify({
            IBAN: $(".playerIBAN").text(),
            status: 'Withdraw',
            amount: $("#cekText").val(),
            time: GetDateAndTime(),
            comingFrom: '',
            editedAmount: editedAmount,
            openedForCompany: openedForCompany
        }));
    });

    $("#IBANParaGonder").click(function(e) {
        let IBANval = $("#targetIBAN").val()
        let miktar = $("#targetAmount").val()
        
        let senderIBAN = $(".playerIBAN").text()

        var editedAmount = "$" + addCommas(String(miktar)) + ",00";

        if (IBANval != "" && miktar > 0 && IBANval != senderIBAN)
        {
            $.post('http://hb_banking/transfer', JSON.stringify({
                targetIBAN: IBANval.toUpperCase(),
                amount: miktar,
                senderIBAN: senderIBAN,
                time: GetDateAndTime(),
                editedAmount: editedAmount,
                openedForCompany: openedForCompany
            }));
        }
    });

    $(document).on('click', '.faturaOdeButton', function () {
        var index = $(this).next().val()        // index
        $.post('http://hb_banking/payBill', JSON.stringify({
            data: billingDatas[index]
        }));
    });

    function addCommas(inputText) {
        // pattern works from right to left
        var commaPattern = /(\d+)(\d{3})(\.\d*)*$/;
        var callback = function (match, p1, p2, p3) {
            return p1.replace(commaPattern, callback) + '.' + p2 + (p3 || '');
        };
        return inputText.replace(commaPattern, callback);
    }

    function AddTransaction(data) {
        var classs = "";
        if (darkMode) {
            classs = "darkness"
        }
        $("#islemler").html($.parseHTML(('<div class="islem '+classs+'"><div class="islemIconHolder"><i class="'+ data.icon + '" aria-hidden="true"></i></div><div class="islemBilgiHolder"><p class="islemTuruText '+classs+'">'+ data.status +'<a class="gonderenGonderilenBilgi '+classs+'">'+data.comingFrom+'</a></p><span class="'+data.color+'">'+ data.amount +'</span><span class="islemZaman '+classs+'">'+ data.time +'</span></div></div>') + $("#islemler").html()))
    }
    
    function AddBill(data) {
    data['editedAmount'] = '$' + addCommas(String(data.amount)) + ',00';
    billingDatas.push(data);

    // Fatura HTML yapısı
    $(".faturalar").html($.parseHTML((
        '<div class="fatura">' +
            '<span class="faturaTarih">' + (data.sell_time || '---') + '</span>' +
            '<button type="button" class="faturaOdeButton">Öde</button>' +
            '<input type="hidden" name="index" value="' + String(billingDatas.length - 1) + '">' +
            '<p class="faturaGonderenIsım">' + (data.sender || 'Unknown') + '</p>' +
            '<span class="faturaAciklama">' + (data.reason || 'No Reason') + '</span>' +
            '<span class="faturaDurum">Ödenmedi</span>' +
            '<span class="faturaUcret">' + data.editedAmount + '</span>' +
        '</div>'
    ) + $(".faturalar").html()))
}

window.addEventListener('message', function(event) {
    if (event.data.type === "deleteBill") {
        const billId = event.data.index;
        // Burada örneğin:
        billsList = billsList.filter(bill => bill.id !== billId);
        // UI'ı güncelle
        updateBillsUI();
    }
});
    function GetDateAndTime() {
        var tarih = new Date();
        return anlik = (("0" + tarih.getDate()).slice(-2) + "-" + ("0" + (tarih.getMonth()+1)).slice(-2)  + "-" + tarih.getFullYear() + " " + ("0" + tarih.getHours()).slice(-2) + ":" + ("0" + tarih.getMinutes()).slice(-2))
    }

    function clearTheUI() {
        $("#islemler").html("")
        $(".faturalar").html("")
    }

   function setupNameAmountAndIBAN(data) {
    if (data.fullName !== undefined && data.fullName !== null) {
        $(".playerName").html(data.fullName)
    } else if (data.firstname !== undefined && data.lastname !== undefined) {
        $(".playerName").html(data.firstname + " " + data.lastname)
    } else {
        $(".playerName").html("Unknown")
    }
    $("#playerMoneyAmount").html(addCommas((String(data.currentMoney))))
    $("#playerMoneyAmount").append(",00")
    $("#playerMoneyAmount").prepend("$")

    // Buradaki IBAN kontrolü:
    if(data.IBAN !== undefined && data.IBAN !== null && data.IBAN !== "") {
        $(".playerIBAN").html(data.IBAN)
    } else {
        $(".playerIBAN").html("IBAN Yok")
    }
}

    function ShowMessage(icon, message) {
        $(".dark").css({ "display":"block"})
        $("#basarili").html('<i class="'+icon+'"></i><br><p class="basariliText">'+message+'</p>')
        setTimeout(function(){jQuery('.dark').fadeIn(1000)}, 500);
        setTimeout(function(){jQuery('.dark').fadeOut(1000)}, 3000);
        $(".dark").css({ "display":"none"})
    }

});