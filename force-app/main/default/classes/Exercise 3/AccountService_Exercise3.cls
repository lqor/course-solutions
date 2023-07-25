public  with sharing  class AccountService_Exercise3 {
      
    public Account createAccount() {
        Account account = new Account();
        
        account.Name = 'Metropolitan Museum of Art';
        account.Industry = 'Not For Profit';
        account.BillingCity = 'New York';
        
        return account;
    }

    public void insertAccount(Account account) {
        if(account == null) {
            return;
        }
        
        insert account;
    }
}