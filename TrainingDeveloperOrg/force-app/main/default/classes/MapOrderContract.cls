public class MapOrderContract {
    public void MapOrderContract() {
        Map<String, List<Order>> listOrderCon = new Map<String, List<Order>>();
        for (Order loc : [SELECT Id, Account.Name, ContractId, Contract.Owner.Name FROM Order LIMIT 20]) {
            if(!listOrderCon.containsKey(loc.Account.Name)) {
                listOrderCon.put(loc.Account.Name, new List<Order>());
            }
            listOrderCon.get(loc.Account.Name).add(loc);
        }
        for (String orderAcc : listOrderCon.keySet()) {
            System.debug(orderAcc == null ? ' Account Not Found! ' : ' ======= Account Name: ' + listOrderCon.get(orderAcc)[0].Account.Name);
            for (Order con : listOrderCon.get(orderAcc)) {
                System.debug(con == null ? ' Contract Not Found! ' : ' Contract Owner: ' + con.Contract.Owner.Name + ' || ' + ' Contract Id: ' + con.ContractId);
            }
        }
    }
}