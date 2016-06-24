function removePhone(linkNode) {
  var link = $(linkNode);
  var myFormGroup = link.parent();
  console.log(myFormGroup.find("input[type=hidden]").val("true"));
  myFormGroup.parent().hide();
}

function addPhone($parent, formHTML) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("id_placeholder", "g");
  var content = formHTML.replace(regexp, new_id)
  $parent.append(content);
}
