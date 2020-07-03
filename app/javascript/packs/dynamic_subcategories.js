const select_categ = document.getElementById("header-text-input1");
const select_subcateg = document.getElementById("header-text-input2");
let arrayoptions = [];
for (var i=1; i<select_subcateg.length; i++) {
  let newoption = {
    value: select_subcateg.options[i].value,
    parent_id:  select_subcateg.options[i].getAttribute("parent_id"),
    innerText: select_subcateg.options[i].innerText
  };
  arrayoptions.push(newoption);
}
select_categ.onchange = function() {
  //console.log(arrayoptions);
  let value = select_categ.value;
  let num = select_subcateg.length;
  for (var i=0; i<(num - 1); i++) {
    let len = select_subcateg.length - 1;
  	select_subcateg.options.remove(len);
  };
  arrayoptions.forEach((option) => {
    if (value != "") {
  	  if (option["parent_id"] === value) {
  	    var new_option = document.createElement("option");
	      new_option.text = option["innerText"];
	      new_option.value = option["value"];
	      select_subcateg.options.add(new_option);
  	  };
    } else {
        var new_option = document.createElement("option");
        new_option.text = option["innerText"];
        new_option.value = option["value"];
        select_subcateg.options.add(new_option);
    }
  });
};
