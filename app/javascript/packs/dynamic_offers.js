const select_categ = document.getElementById("offer_category");
const select_subcateg = document.getElementById("offer_subcategory");
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
  console.log(arrayoptions);
  let value = select_categ.value;
  let num = select_subcateg.length;
  for (var i=0; i<num; i++) {
  	select_subcateg.options.remove(0);
  }
  arrayoptions.forEach((option) => {
  	if (option["parent_id"] === value) {
  	  var new_option = document.createElement("option");
	  new_option.text = option["innerText"];
	  new_option.value = option["value"];
	  select_subcateg.options.add(new_option);
  	};
  });
};
