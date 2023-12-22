public class MapOrderConAcc {
    public void MapOrderConAcc() {
        Map<String, Map<String, List<Order>>> listOrderConAcc = new Map<String, Map<String, List<Order>>>();
        List<Order> ord = [SELECT Id, OrderNumber, Account.Name, ContractId, Contract.Owner.Name FROM Order LIMIT 20];
        for (Order o : ord) {
            if(!listOrderConAcc.containsKey(o.Account.Name)) {
                listOrderConAcc.put(o.Account.Name, new Map<String, List<Order>>());
            }
            if(!listOrderConAcc.get(o.Account.Name).containsKey(o.Contract.Owner.Name)) {
                listOrderConAcc.get(o.Account.Name).put(o.Contract.Owner.Name, new List<Order>());
            }
            listOrderConAcc.get(o.Account.Name).get(o.Contract.Owner.Name).add(o);
        }
        for (String accName : listOrderConAcc.keySet()) {
            System.debug(' ======= Account Name: ' + accName + ' ======= '); // Pego minha 1° chave do meu map
            for (String conName : listOrderConAcc.get(accName).keySet()) {
                System.debug(' ======= Contract Owner: ' + listOrderConAcc.get(accName).get(conName)[0].Contract.Owner.Name + ' ======= '); //Pego minha 2° chave do meu map
                for (Order order : listOrderConAcc.get(accName).get(conName)) {
                    System.debug(' ======= Order Number: ' +  order.OrderNumber + ' ======= '); //Pego meu valor do meu map, que é a minha new List<Order>();
                }
            }
        }
    }
}