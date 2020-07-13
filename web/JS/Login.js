// TODO: 验证码
function isValid(form)
{
    if (form.username.value==="")
    {
        toastr.error("Username can't be empty.");
        return false;
    }
    if (form.password.value==="")
    {
        toastr.error("Password can't be empty.");
        return false;
    }
    else return true;
}