$(document).ready(function () {
    $("#clear-icon").hide();
    getContacts();
    $(".modal").modal();
});


function getContacts() {
    var url = "/api/PhoneBook/GetContacts";
    $.ajax({
        contentType: 'application/json',
        type: "GET",
        url: url,
        success: function (data) {
            initSearchBoxAuto(data);
            $("#contacts-list").html("");
            buildContactsTable(data);
        },
        error: function (jqXHR) {
            alert("Failed! Please try again.");
        }
    });
}


function buildContactsTable(elements) {
    var html = "";
    for (var i = 0; i < elements.length; i++) {
        html += "<li class='collection-item avatar'>\
                 <i class='material-icons circle red'>account_circle</i>\
                 <span>"+ elements[i].name + "</span>\
                 <p>"+ elements[i].phoneNumber + "</p>\
                 </li>";
    }
    $("#contacts-list").html(html);


    $("#save-Contact").click(function () {
        var name = $("#contact-name").val();
        var phoneNumber = $("#contact-number").val();
        if (name !== "" && phoneNumber !== "") {
            var body = {
                Name: name,
                PhoneNumber: phoneNumber
            };
            addContact(body);

        }
        else {
            M.toast({ html: "Required fields" });
        }
    })

    function addContact(body) {
        var url = "/api/PhoneBook/AddContact";
        $.ajax({
            contentType: 'application/json',
            type: "POST",
            url: url,
            data: JSON.stringify(body),
            success: function (data) {
                M.toast({ html: 'contact Added' });
                $('.modal').modal('close');
                getContacts();
            },
            error: function (jqXHR) {
                M.toast({ html: 'Something went wrong' });
            }
        });
    }
}


function initSearchBoxAuto(Obj) {
    var contactsArray = Obj;
    var conatactsList = {};
    for (var i = 0; i < contactsArray.length; i++) {
        conatactsList[contactsArray[i].name] = null;
    }
    
    $('input.autocomplete').autocomplete({
        data: conatactsList,
        limit: 7, // The max amount of results that can be shown at once. Default: Infinity.
        onAutocomplete: function (val) {
            console.log(val);
            doSearch(val,Obj)
        },
        minLength: 1,
    });
}

function doSearch(name, data) {
    var item = data.find(n => n.name === name);
    $("#contacts-list").html("");
    var html = "";
        html += "<li class='collection-item avatar'>\
                 <i class='material-icons circle red'>account_circle</i>\
                 <span>"+ item.name + "</span>\
                 <p>"+ item.phoneNumber + "</p>\
                 </li>";    
    $("#contacts-list").html(html);
    $("#clear-icon").show();
}

$("#clear-icon").click(function () {
    $("#clear-icon").hide();
    $("#autocomplete-input").val("");
    getContacts();   
});
