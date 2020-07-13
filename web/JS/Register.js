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
    if (form.email.value==="")
    {
        toastr.error("Email can't be empty.");
        return false;
    }
    var email = form.email.value;
    var reg = /^([a-zA-Z]|[0-9])+@[a-zA-Z0-9]+\.([a-zA-Z])$/;
    if (!reg.test(email)) {
        toastr.error("Invalid email.");
        return false;
    }
    else return true;
}