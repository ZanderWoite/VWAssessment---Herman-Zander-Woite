$(document).ready(function () {
    LoadCarModelList();
});

function LoadCarModelList() {
    var selectedModel = "";
    $.ajax({
        url: "/Home/SelectCarModel",
        type: "GET",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        success: function (result) {
            var html = "";
            $.each(result, function (key, item) {
                html += '<option value="' + item.Model_ID + '">' + item.Model_Description + '</option>';
            });

            $('#models').html(html);
        },

        error: function (errorMessage) {
            alert(errorMessage.responseText);
        }
    });
};



function LoadSubModelList() {
    var selectedModel = document.getElementById("models").value;
    $.ajax({
        url: "/Home/SelectSubModel",
        type: "GET",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        success: function (result) {
            var html = "";
            $.each(result, function (key, item) {
                if (selectedModel == item.Model_ID) {
                    html += '<option value="' + item.SubModel_ID + '">' + item.SubModel_Description + '</option>';
                }

            });

            $('#submodels').html(html);
        },

        error: function (errorMessage) {
            alert(errorMessage.responseText);
        }
    });
};

function CombineFunction() {
    LoadFeatureList();
    LoadPriceStockList();
    $("#featureAdd").show();
    $("#featureAddLabel").show();
    $("#featureAddBtn").show();
}

function LoadPriceStockList() {
    var selectedSubModel = document.getElementById("submodels").value;
    $.ajax({
        url: "/Home/SelectSubModel",
        type: "GET",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        success: function (result) {
            var html = "";
            $.each(result, function (key, item) {
                if (selectedSubModel == item.SubModel_ID) {
                    html += '<label>Stock: </label>';
                    html += '<input id="stock" type="number" value="' + item.Stock + '" />';
                    html += '        <br />';
                    html += '<label>Price(R): </label>';
                    html += '<input type="number" value="' + item.Price + '" />';
                    html += '        <br />';
                }

            });

            $('#priceStock').html(html);
        },

        error: function (errorMessage) {
            alert(errorMessage.responseText);
        }
    });
};

function LoadFeatureList() {
    var selectedSubModel = document.getElementById("submodels").value;
    $.ajax({
        url: "/Home/SelectFeature",
        type: "GET",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        success: function (result) {
            var html = "";
            $.each(result, function (key, item) {
                if (selectedSubModel == item.SubModel_ID) {
                    html += '<li>' + item.Feature_Description + '</li>';
                }

            });

            $('#features').html(html);
        },

        error: function (errorMessage) {
            alert(errorMessage.responseText);
        }
    });
};

function LoadAllList() {
    if (document.getElementById("viewAll").hidden = false) {
        document.getElementById("viewAll").hidden = true;
    };
    if (document.getElementById("viewAll").hidden = true) {
        document.getElementById("viewAll").hidden = false;
    };
    $.ajax({
        url: "/Home/SelectAll",
        type: "GET",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        success: function (result) {
            var html = "";
            $.each(result, function (key, item) {
                html += '<tr>';
                html += '<td>' + item.Model_Description + '</td>';
                html += '<td>' + item.SubModel_Description + '</td>';
                html += '<td>' + item.Stock + '</td>';
                html += '<td>' + item.Price + '</td>';
                html += '<td><a href="#" onclick="return GetSubModelById(' + item.SubModel_ID + ')">Edit</a></td>';
                html += '<td><a href="#" onclick="return DeleteCar(' + item.SubModel_ID + ')">Delete</a></td>';
                html += '</tr>';
            });

            $('#tbody').html(html);
        },
        error: function (errorMessage) {
            alert(errorMessage.responseText);
        }
    });
};

function DeleteCar(subModelId) {
    var res = confirm("Are you sure to delete the model from the system?");
    if (res) {
        $.ajax({
            url: "/Home/DeleteCar/" + subModelId,
            type: "POST",
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            success: function (result) {
                LoadCarModelList();
            },
            error: function (errorMessage) {
                alert(errorMessage.responseText);
            }
        });
    }
}

function LoadAvailableModelList() {
    $.ajax({
        url: "/Home/SelectAvailableModels",
        type: "GET",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        success: function (result) {
            var html = "";
            $.each(result, function (key, item) {
                html += '<option value="' + item.Model_ID + '">' + item.Model_Description + '</option>';
            });

            $('#availableModels').html(html);
            $('#modalTitleUpdate').hide();
            $('#modalTitleAdd').show();
            $('#btnUpdate').hide();
            $('#btnAdd').show();
        },

        error: function (errorMessage) {
            alert(errorMessage.responseText);
        }
    });
};

function InsertSubModel() {
    var selectedModel = document.getElementById("availableModels").value;
    var inputObj = {
        Model_ID: selectedModel,
        SubModel_Description: $('#subModel_Description').val(),
        Price: $('#price').val(),
        Stock: $('#stock').val()
    }

    $.ajax({
        url: "/Home/InsertSubModel",
        data: JSON.stringify(inputObj),
        type: "POST",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        success: function (result) {
            LoadAvailableModelList();
            $('#myModal2').modal('hide');
            $('body').removeClass('modal-open');
            $('.modal-backdrop').remove();
        },
        error: function (errorMessage) {
            alert(errorMessage.responseText);
        }
    });
}

function GetSubModelById(subId) {
    $.ajax({
        url: "/Home/GetSubModelById/" + subId,
        type: "GET",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        success: function (result) {
            $('#availableModels').val(result.Model_ID),
                $('#subModel_Description').val(result.SubModel_Description),
                $('#price').val(result.Price),
                $('#stock').val(result.Stock)

            $('#myModal2').modal('show');
            $('#btnUpdate').show();
            $('#btnAdd').hide();
            $('#modalTitleUpdate').show();
            $('#modalTitleAdd').hide();
        },
        error: function (errorMessage) {
            alert(errorMessage.responseText);
        }
    });
}

function UpdateSubModel() {
    var selectedModel = document.getElementById("availableModels").value;
    var inputObj = {
        Model_ID: selectedModel,
        SubModel_Description: $('#subModel_Description').val(),
        Price: $('#price').val(),
        Stock: $('#stock').val()
    }

    $.ajax({
        url: "/Home/UpdateSubModel",
        data: JSON.stringify(inputObj),
        type: "POST",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        success: function (result) {
            LoadAvailableModelList();
            $('#myModal2').modal('hide');
            $('#btnUpdate').show();
            $('#btnAdd').hide();
            $('#modalTitleUpdate').show();
            $('#modalTitleAdd').hide();
            $('#availableModels').val(""),
                $('#subModel_Description').val(""),
                $('#price').val(""),
                $('#stock').val("")
        },
        error: function (errorMessage) {
            alert(errorMessage.responseText);
        }
    });
}

function ClearForm() {

    $('#availableModels').val("");
    $('#subModel_Description').val("");
    $('#price').val("");
    $('#stock').val("");
    LoadAvailableModelList();
    $('#stock').css('border-color', 'lightgrey');
    $('#subModel_Description').css('border-color', 'lightgrey');
    $('#price').css('border-color', 'lightgrey');

    $('#btnUpdate').hide();
    $('#btnAdd').show();
    $('#modalTitleUpdate').hide();
    $('#modalTitleAdd').show();
}

