trigger validateContactTriggeron on Contact (before insert) {

        if(Trigger.isBefore && Trigger.isInsert)
    {
        for(Contact con:Trigger.New)
        {
            if(con.Phone == null || con.Phone == '')
            {
             con.addError('Should not be blank');  
            }
            else if(con.Email == null || con.Email == '')
            {
                con.Email.addError('Should not be blank in the email'); 
            }
        }
    }
}