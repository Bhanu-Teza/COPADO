trigger UpdateAccount on Contact (after insert) {

    Set<Id>  sName = new Set<Id>();
    for(Contact con:Trigger.new)
    {
        sName.add(con.AccountId);
    }
    Integer acc =[Select count() from Account where Id IN:sName];
    
    for(Contact acList:Trigger.New)
    {
     Account ac = new Account(id =acList.AccountId);
     ac.AnnualRevenue =Integer.valueOf(acc);
    }

}