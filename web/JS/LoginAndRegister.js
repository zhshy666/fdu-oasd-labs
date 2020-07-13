// TODO : 邮箱格式合法性检查
// TODO : 验证码
function isValid(form)
{
    if (form.username.value==="")
    {
        toastr.error("First name can't be empty.");
        return false;
    }
    if (form.password.value==="")
    {
        toastr.error("Password can't be empty.");
        return false;
    }
    if (form.email.value==="")
    {
        toastr.error("Email can't be empty.");
        return false;
    }
    var email = form.email.value;
    var reg = /^([a-zA-Z]|[0-9])+@[a-zA-Z0-9]+\.([a-zA-Z])$/;
    if (!reg.test(email)) {
        toastr.error("Email: invalid format.");
        return false;
    }
    else return true;

}