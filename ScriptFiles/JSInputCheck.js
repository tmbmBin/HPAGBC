

function MoneyOnly()
{
    if((event.keyCode>=48 && event.keyCode<=57)||(event.keyCode==45)||(event.keyCode==46))
    {return true;}
    else
    {
        event.keyCode=0;
        false;
    }
}


function NumberOnly()
{
    if((event.keyCode>=48 && event.keyCode<=57))
    {return true;}
    else
    {
        event.keyCode=0;
        false;
    }
}

function NumberAndCommaOnly() {
    if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode == 44))
    { return true; }
    else {
        event.keyCode = 0;
        false;
    }
}

function NumberAndEngLetterOnly() {
    if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 65 && event.keyCode <= 90) || (event.keyCode >= 97 && event.keyCode <= 122))
    { return true; }
    else {
        event.keyCode = 0;
        false;
    }
}

function DateOnly()
{
    if((event.keyCode>=48 && event.keyCode<=57)||(event.keyCode==47))
    {return true;}
    else
    {
        event.keyCode=0;
        false;
    }
}
