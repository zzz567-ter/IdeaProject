function redepartment(name) {
    $("#sdepartment").prop("value", name)
}

function check(forms) { //有报错则暂停
    if (forms.sdepartment.value == "") {
        if (forms.sclass.value == "") {
            if (forms.sname.value == "") {
                alert("请输入查询索引")
                return false;
            }return true;
        }return true;
    }return true;
}
