// ---------------------------------------------------------------
//	text_manipulate.js
//
//					Oct/31/2012
//
// ---------------------------------------------------------------
var fs = require("fs");
var text_manipulate = require("./text_manipulate");

// ---------------------------------------------------------------
exports.text_read_proc = function (file_in) {
    var dict_aa = new Object();

    var data = fs.readFileSync(file_in, 'utf8');

    var lines_in = ("" + data).split("\n");

    for (var it = 0; it < lines_in.length; it++) {
        var rr = lines_in[it].split("\t");

        dict_aa[rr[0]] = {
            "name": rr[1], "population": rr[2],
            "date_mod": rr[3] };
    }

    return dict_aa;
};

// ---------------------------------------------------------------
exports.dict_display_proc = function (dict_aa) {
    for (var key in dict_aa) {
        if (key) {
            if ((key != '_id') && (key != '_rev')) {
                var out_str = key + "\t";
                out_str += dict_aa[key]["name"] + "\t";
                out_str += dict_aa[key]["population"] + "\t";
                out_str += dict_aa[key]["date_mod"];
                console.log(out_str);
            }
        }
    }
    // console.log ("*** dict_display_proc ppp ***");
};

// ---------------------------------------------------------------
exports.text_write_proc = function (file_out, dict_aa) {
    var out_str = "";

    var delimit = "\t";

    for (var id in dict_aa) {
        if (id) {
            out_str += id + delimit;
            out_str += dict_aa[id]["name"] + delimit;
            out_str += dict_aa[id]["population"] + delimit;
            out_str += dict_aa[id]["date_mod"] + "\n";
        }
    }

    fs.writeFile(file_out, out_str, function (err) {
        if (err) {
            console.log("Error on write: " + err);
        } else {
            console.log("File written.");
        }
    });
};

// ---------------------------------------------------------------
exports.dict_update_proc = function (dict_in, id_in, population_in) {
    if (dict_in[id_in]) {
        dict_in[id_in]["population"] = population_in;
        dict_in[id_in]["date_mod"] = text_manipulate.get_current_date_proc();
    }

    return dict_in;
};

// ---------------------------------------------------------------
exports.dict_append_proc = function (dict_aa, id_in, name_in, population_in, date_mod_in) {
    unit_aa = {};
    unit_aa['name'] = name_in;
    unit_aa['population'] = population_in;
    unit_aa['date_mod'] = date_mod_in;

    dict_aa[id_in] = unit_aa;

    return dict_aa;
};

// ---------------------------------------------------------------
exports.csv_read_proc = function (file_in) {
    var dict_aa = new Object();

    var data = fs.readFileSync(file_in, 'utf8');

    var lines_in = ("" + data).split("\n");

    for (var it = 0; it < lines_in.length; it++) {
        var rr = lines_in[it].split(",");

        dict_aa[rr[0]] = {
            "name": rr[1], "population": rr[2],
            "date_mod": rr[3] };
    }

    return dict_aa;
};

// ---------------------------------------------------------------
exports.csv_write_proc = function (file_out, dict_aa) {
    var out_str = "";

    var delimit = ",";

    for (var id in dict_aa) {
        if (id) {
            out_str += id + delimit;
            out_str += dict_aa[id]["name"] + delimit;
            out_str += dict_aa[id]["population"] + delimit;
            out_str += dict_aa[id]["date_mod"] + "\n";
        }
    }

    fs.writeFile(file_out, out_str, function (err) {
        if (err) {
            console.log("Error on write: " + err);
        } else {
            console.log("File written.");
        }
    });
};

// ---------------------------------------------------------------
exports.get_current_date_proc = function () {
    var today = new Date();
    var ddx = (1900 + today.getYear()) + "-" + (today.getMonth() + 1);
    ddx += "-" + today.getDate();

    return ddx;
};
// ---------------------------------------------------------------
