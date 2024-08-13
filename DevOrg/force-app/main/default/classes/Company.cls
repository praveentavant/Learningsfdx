// Company class
// stores information about the company
// and its customers

public with sharing class Company {
    public string companyName;
    public string ceo;
    public Integer employeeCount;
    public long revenue;

    // list of all the customers
    Private List<Client> customers = new List<Client>();

    //add new customer
    public void addNewCustomer(string clientName,string webSite,Integer email,long phone){
        Client customer=new Client(clientName,webSite,email,phone);
        customers.add(customer);

    }

    public void getAllCustomers(){
        for(Client customer:customers){
            system.debug('Customer Name:'+customer.clientName+'Website: '+customer.webSite+'Phone :'+customer.phone+'email: '+customer.email);
        }

    }
    private class Client{
        public string clientName;
        public string webSite;
        public Integer email;
        public long phone;

        Client(string clientName,string webSite,Integer email,long phone){
            this.clientName=clientName;
            this.webSite=webSite;
            this.email=email;
            this.phone=phone;

        }

    }




   
}